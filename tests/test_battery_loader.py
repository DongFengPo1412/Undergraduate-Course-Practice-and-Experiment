import importlib.util
import os
from pathlib import Path
import tempfile
import uuid
import unittest
import openpyxl

ROOT = Path(__file__).resolve().parents[1]
SOURCE = next(ROOT.glob('Year3*/*/03-*/*/src/battery_soh_regressor.py'))
spec = importlib.util.spec_from_file_location('battery_course', SOURCE)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)

class BatteryInputTests(unittest.TestCase):
    def workbook(self, rows):
        directory = Path(os.environ.get('PORTFOLIO_TEST_TMP', tempfile.gettempdir())) / ('battery-loader-' + uuid.uuid4().hex)
        directory.mkdir(parents=True)
        path = directory / 'sample.xlsx'
        wb = openpyxl.Workbook()
        for row in rows: wb.active.append(row)
        wb.save(path); wb.close()
        return path

    def test_complete_finite_rows_only(self):
        path = self.workbook([['cc_duration','cv_duration','timeInterval','ica_max','SOH'],
                              [1,2,3,4,0.8], [None,2,3,4,0.9], ['bad',2,3,4,0.9]])
        x,y = module.load_battery_data(path)
        self.assertEqual(x.shape,(1,4)); self.assertAlmostEqual(float(y[0]),0.8,places=6)

    def test_empty_workbook_rejected(self):
        path = self.workbook([['cc_duration','cv_duration','timeInterval','ica_max','SOH']])
        with self.assertRaises(ValueError): module.load_battery_data(path)

if __name__ == '__main__': unittest.main()
