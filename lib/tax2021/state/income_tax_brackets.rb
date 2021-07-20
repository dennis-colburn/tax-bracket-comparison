module Tax2021
  module State
    INCOME_TAX_BRACKETS = {
      AL: {
        SINGLE: [[0, 500, 0.02], [501, 3_000, 0.04], [3_001, Float::INFINITY, 0.05]],
        MARRIED: [[0, 1_000, 0.02], [1_001, 6_000, 0.04], [6_001, Float::INFINITY, 0.05]]
      },

      AK: {
        SINGLE: [[0, Float::INFINITY, 0]],
        MARRIED: [[0, Float::INFINITY, 0]]
      },

      AR: {
        SINGLE: [[0, 4_000, 0.02], [4_001, 8_000, 0.04], [8_001, Float::INFINITY, 0.059]],
        MARRIED: [[0, 4_000, 0.02], [4_001, 8_000, 0.04], [8_001, Float::INFINITY, 0.059]]
      },

      AZ: {
        SINGLE: [[0, 27_272, 0.0259], [27_273, 54_544, 0.0334], [54_545, 163_632, 0.0417],
                 [163_633, 250_000, 0.045], [250_001, Float::INFINITY, 0.08]],
        MARRIED: [[0, 54_544, 0.0259], [54_545, 109_088, 0.0334], [109_089, 327_263, 0.0417],
                  [327_264, 500_000, 0.045], [500_001, Float::INFINITY, 0.08]]
      },

      CA: {
        SINGLE: [[0, 8_932, 0.01], [8_933, 21_175, 0.02], [21_176, 33_421, 0.04],
                 [33_422, 46_394, 0.06], [46_395, 58_634, 0.08], [58_635, 299_508, 0.093],
                 [299_509, 359_407, 0.103], [359_408, 599_012, 0.113],
                 [599_013, 1_000_000, 0.123], [1_000_001, Float::INFINITY, 0.133]],
        MARRIED: [[0, 17_864, 0.01], [17_865, 42_350, 0.02], [42_351, 66_842, 0.04],
                  [66_843, 92_788, 0.06], [92_789, 117_268, 0.08], [117_269, 599_016, 0.093],
                  [599_017, 718_814, 0.103], [718_815, 1_000_000, 0.113],
                  [1_000_001, 1_198_024, 0.123], [1_198_025, Float::INFINITY, 0.133]]
      },

      CO: {
        SINGLE: [[0, Float::INFINITY, 0.0455]],
        MARRIED: [[0, Float::INFINITY, 0.0455]]
      },

      CT: {
        SINGLE: [[0, 10_000, 0.03], [10_001, 50_000, 0.05], [50_001, 100_000, 0.055],
                 [100_001, 200_000, 0.06], [200_001, 250_000, 0.065],
                 [250_001, 500_000, 0.069], [500_001, Float::INFINITY, 0.0699]],
        MARRIED: [[0, 20_000, 0.03], [20_001, 100_000, 0.05], [100_001, 200_000, 0.055],
                  [200_001, 400_000, 0.06], [400_001, 500_000, 0.065],
                  [500_001, 1_000_000, 0.069], [1_000_001, Float::INFINITY, 0.0699]]
      },

      DC: {
        SINGLE: [[0, 10_000, 0.04], [10_001, 40_000, 0.06], [40_001, 60_000, 0.065],
                 [60_001, 350_000, 0.085], [350_001, 1_000_000, 0.0875],
                 [1_000_001, Float::INFINITY, 0.0895]],
        MARRIED: [[0, 10_000, 0.04], [10_001, 40_000, 0.06], [40_001, 60_000, 0.065],
                  [60_001, 350_000, 0.085], [350_001, 1_000_000, 0.0875],
                  [1_000_001, Float::INFINITY, 0.0895]]
      },

      DE: {
        SINGLE: [[0, 2_000, 0.00], [2_001, 5_000, 0.022], [5_001, 10_000, 0.039],
                 [10_001, 20_000, 0.048], [20_001, 25_000, 0.052], [25_001, 60_000, 0.0555],
                 [60_001, Float::INFINITY, 0.066]],
        MARRIED: [[0, 2_000, 0.00], [2_001, 5_000, 0.022], [5_001, 10_000, 0.039],
                  [10_001, 20_000, 0.048], [20_001, 25_000, 0.052], [25_001, 60_000, 0.0555],
                  [60_001, Float::INFINITY, 0.066]]
      },

      FL: {
        SINGLE: [[0, Float::INFINITY, 0]],
        MARRIED: [[0, Float::INFINITY, 0]]
      },

      GA: {
        SINGLE:  [[0, 750, 0.01], [751, 2_250, 0.02], [2_251, 3_750, 0.03],
                  [3_751, 5_250, 0.04], [5_251, 7_000, 0.05], [7_001, Float::INFINITY, 0.0575]],
        MARRIED: [[0, 1_000, 0.01], [1_001, 3_000, 0.02], [3_001, 5_000, 0.03],
                  [5_001, 7_000, 0.04], [7_001, 10_000, 0.05], [10_001, Float::INFINITY, 0.0575]]
      },

      HI: {
        SINGLE: [[0, 2_400, 0.014], [2_401, 4_800, 0.032], [4_801, 9_600, 0.055],
                 [9_601, 14_400, 0.064], [14_401, 19_200, 0.068], [19_201, 24_000, 0.072],
                 [24_001, 36_001, 0.076], [36_001, 48_001, 0.079], [48_001, 150_001, 0.0825],
                 [150_001, 175_000, 0.09], [175_001, 200_000, 0.10],
                 [200_001, Float::INFINITY, 0.11]],
        MARRIED: [[0, 4_800, 0.014], [4_801, 9_600, 0.032], [9_601, 19_200, 0.055],
                  [19_201, 28_800, 0.064], [28_801, 38_400, 0.068], [38_401, 48_000, 0.072],
                  [48_001, 72_001, 0.076], [72_001, 96_001, 0.079], [96_001, 300_001, 0.0825],
                  [300_001, 350_000, 0.09], [350_001, 400_000, 0.10],
                  [400_001, Float::INFINITY, 0.11]]
      },

      IA: {
        SINGLE: [[0, 1_676, 0.0033], [1_677, 3_352, 0.0067], [3_353, 6_704, 0.0225],
                 [6_705, 15_084, 0.0414], [15_085, 25_140, 0.0563], [25_141, 33_520, 0.0596],
                 [33_521, 50_280, 0.0625], [50_281, 75_420, 0.0744],
                 [75_421, Float::INFINITY, 0.0853]],
        MARRIED: [[0, 1_676, 0.0033], [1_677, 3_352, 0.0067], [3_353, 6_704, 0.0225],
                  [6_705, 15_084, 0.0414], [15_085, 25_140, 0.0563], [25_141, 33_520, 0.0596],
                  [33_521, 50_280, 0.0625], [50_281, 75_420, 0.0744],
                  [75_421, Float::INFINITY, 0.0853]]
      },

      ID: {
        SINGLE: [[0, 1_568, 0.01125], [1_569, 3_136, 0.03125], [3_137, 4_704, 0.03625],
                 [4_705, 6_272, 0.04625], [6_273, 7_840, 0.05625], [7_841, 11_760, 0.06625],
                 [11_761, Float::INFINITY, 0.06925]],
        MARRIED: [[0, 3_136, 0.01125], [3_137, 6_272, 0.03125], [6_273, 9_408, 0.03625],
                  [9_409, 12_544, 0.04625], [12_545, 15_680, 0.05625], [15_681, 23_520, 0.06625],
                  [23_521, Float::INFINITY, 0.06925]]
      },

      IL: {
        SINGLE: [[0, Float::INFINITY, 0.0495]],
        MARRIED: [[0, Float::INFINITY, 0.0495]]
      },

      IN: {
        SINGLE: [[0, Float::INFINITY, 0.0323]],
        MARRIED: [[0, Float::INFINITY, 0.0323]]
      },

      KS: {
        SINGLE: [[0, 15_000, 0.031], [15_001, 30_000, 0.0525], [30_001, Float::INFINITY, 0.057]],
        MARRIED: [[0, 30_000, 0.031], [30_001, 60_000, 0.0525], [60_001, Float::INFINITY, 0.057]]
      },

      KY: {
        SINGLE: [[0, Float::INFINITY, 0.05]],
        MARRIED: [[0, Float::INFINITY, 0.05]]
      },

      LA: {
        SINGLE: [[0, 12_500, 0.02], [12_501, 50_000, 0.04], [50_001, Float::INFINITY, 0.06]],
        MARRIED: [[0, 25_000, 0.02], [25_001, 100_000, 0.04], [100_001, Float::INFINITY, 0.06]]
      },

      MA: {
        SINGLE: [[0, Float::INFINITY, 0.05]],
        MARRIED: [[0, Float::INFINITY, 0.05]]
      },

      MD: {
        SINGLE: [[0, 1_000, 0.02], [1_001, 2_000, 0.03], [2_001, 3_000, 0.04],
                 [3_001, 100_000, 0.0475], [100_001, 125_000, 0.05], [125_001, 150_000, 0.0525],
                 [150_001, 250_000, 0.055], [250_001, Float::INFINITY, 0.0575]],
        MARRIED: [[0, 1_000, 0.02], [1_001, 2_000, 0.03], [2_001, 3_000, 0.04],
                  [3_001, 150_000, 0.0475], [150_001, 175_000, 0.05],
                  [175_001, 225_000, 0.0525], [225_001, 300_000, 0.055],
                  [300_001, Float::INFINITY, 0.0575]],
      },

      ME: {
        SINGLE: [[0, 22_450, 0.058], [22_451, 53_150, 0.0675], [53_151, Float::INFINITY, 0.0715]],
        MARRIED: [[0, 44_950, 0.058], [44_951, 106_350, 0.0675], [106_351, Float::INFINITY, 0.0715]],
      },

      MI: {
        SINGLE: [[0, Float::INFINITY, 0.0425]],
        MARRIED: [[0, Float::INFINITY, 0.0425]]
      },

      MN: {
        SINGLE: [[0, 27_230, 0.0535], [27_231, 89_440, 0.068], [89_441, 166_040, 0.0785],
                 [166_041, Float::INFINITY, 0.0985]],
        MARRIED: [[0, 39_810, 0.0535], [39_811, 158_140, 0.068], [158_141, 276_200, 0.0785],
                  [276_201, Float::INFINITY, 0.0985]],
      },

      MO: {
        SINGLE: [[0, 107, 0.00], [108, 1_073, 0.015], [1_074, 2_146, 0.02], [2_145, 3_219, 0.025],
                 [3_220, 4_292, 0.03], [4_293, 5_365, 0.035], [5_366, 6_438, 0.04],
                 [6_439, 7_511, 0.045], [7_512, 8_584, 0.05], [8_585, Float::INFINITY, 0.054]],
        MARRIED: [[0, 107, 0.00], [108, 1_073, 0.015], [1_074, 2_146, 0.02], [2_145, 3_219, 0.025],
                  [3_220, 4_292, 0.03], [4_293, 5_365, 0.035], [5_366, 6_438, 0.04],
                  [6_439, 7_511, 0.045], [7_512, 8_584, 0.05], [8_585, Float::INFINITY, 0.054]]
      },

      MS: {
        SINGLE: [[0, 4_000, 0.00], [4_001, 5_000, 0.03], [5_001, 10_000, 0.04],
                 [10_001, Float::INFINITY, 0.05]],
        MARRIED: [[0, 4_000, 0.00], [4_001, 5_000, 0.03], [5_001, 10_000, 0.04],
                  [10_001, Float::INFINITY, 0.05]]
      },

      MT: {
        SINGLE: [[0, 3_100, 0.01], [3_101, 5_500, 0.02], [5_501, 8_400, 0.03],
                 [8_401, 11_300, 0.04], [11_301, 14_500, 0.05], [14_501, 18_700, 0.06],
                 [18_701, Float::INFINITY, 0.069]],
        MARRIED: [[0, 3_100, 0.01], [3_101, 5_500, 0.02], [5_501, 8_400, 0.03],
                  [8_401, 11_300, 0.04], [11_301, 14_500, 0.05], [14_501, 18_700, 0.06],
                  [18_701, Float::INFINITY, 0.069]]
      },

      NC: {
        SINGLE: [[0, Float::INFINITY, 0.0525]],
        MARRIED: [[0, Float::INFINITY, 0.0525]]
      },

      ND: {
        SINGLE: [[0, 40_125, 0.011], [40_126, 97_150, 0.0204], [97_151, 202_650, 0.0227],
                 [202_651, 440_600, 0.0264],  [440_601, Float::INFINITY, 0.029]],
        MARRIED: [[0, 67_050, 0.011], [67_051, 161_950, 0.0204], [161_951, 246_700, 0.0227],
                  [246_701, 440_600, 0.0264],  [440_601, Float::INFINITY, 0.029]]
      },

      NE: {
        SINGLE: [[0, 3_340, 0.0246], [3_341, 19_990, 0.0351], [19_991, 32_210, 0.0501],
                 [32_211, Float::INFINITY, 0.0684]],
        MARRIED: [[0, 6_660, 0.0246], [6_661, 39_990, 0.0351], [39_991, 64_430, 0.0501],
                  [64_431, Float::INFINITY, 0.0684]]
      },

      NH: {
        SINGLE: [[0, Float::INFINITY, 0.05]],
        MARRIED: [[0, Float::INFINITY, 0.05]]
      },

      NJ: {
        SINGLE: [[0, 20_000, 0.014], [20_001, 35_000, 0.0175], [35_001, 40_000, 0.035],
                 [40_001, 75_000, 0.05525], [75_001, 500_000, 0.0637],
                 [500_001, 1_000_000, 0.0897], [1_000_001, Float::INFINITY, 0.1075]],
        MARRIED: [[0, 20_000, 0.014], [20_001, 50_000, 0.0175], [50_001, 70_000, 0.0245],
                  [70_001, 80_000, 0.0350], [80_001, 150_000, 0.05525],
                  [150_001, 500_000, 0.0637], [500_001, 1_000_000, 0.0897],
                  [1_000_001, Float::INFINITY, 0.1075]]
      },

      NM: {
        SINGLE: [[0, 5_500, 0.017], [5_501, 11_000, 0.032], [11_001, 16_000, 0.047],
                 [16_001, 210_000, 0.049], [210_001, Float::INFINITY, 0.059]],
        MARRIED: [[0, 8_000, 0.017], [8_001, 16_000, 0.032], [16_001, 24_000, 0.047],
                  [24_001, 315_000, 0.049], [315_001, Float::INFINITY, 0.059]]
      },

      NV: {
        SINGLE: [[0, Float::INFINITY, 0]],
        MARRIED: [[0, Float::INFINITY, 0]]
      },

      NY: {
        SINGLE: [[0, 8_500, 0.04], [8_501, 11_700, 0.045], [11_701, 13_900, 0.0525],
                 [13_901, 21_400, 0.059], [21_401, 80_650, 0.0597], [80_651, 215_400, 0.0633],
                 [215_401, 1_077_550, 0.0685], [1_077_551, Float::INFINITY, 0.0882]],
        MARRIED: [[0, 17_150, 0.04], [17_151, 23_600, 0.045], [23_601, 27_900, 0.0525],
                  [27_901, 43_000, 0.059], [43_001, 161_550, 0.0597],
                  [161_551, 323_200, 0.0633], [323_201, 2_155_350, 0.0685],
                  [2_155_351, Float::INFINITY, 0.0882]]
      },

      OH: {
        SINGLE: [[0, 22_150, 0.00], [22_151, 44_250, 0.0285],
                 [44_251, 88_450, 0.03326], [88_451, 110_650, 0.03802],
                 [110_651, 221_300, 0.04413], [221_301, Float::INFINITY, 0.04797]],
        MARRIED: [[0, 22_150, 0.00], [22_151, 44_250, 0.0285],
                  [44_251, 88_450, 0.03326], [88_451, 110_650, 0.03802],
                  [110_651, 221_300, 0.04413], [221_301, Float::INFINITY, 0.04797]]
      },

      OK: {
        SINGLE: [[0, 1_000, 0.005], [1_001, 2_500, 0.01], [2_501, 3_750, 0.02],
                 [3_751, 4_900, 0.03], [4_901, 7_200, 0.04], [7_201, Float::INFINITY, 0.05]],
        MARRIED: [[0, 2_000, 0.005], [2_001, 5_000, 0.01], [5_001, 7_500, 0.02],
                  [7_501, 9_800, 0.03], [9_801, 12_200, 0.04], [12_201, Float::INFINITY, 0.05]]
      },

      OR: {
        SINGLE: [[0, 3_650, 0.0475], [3_651, 9_200, 0.0675], [9_201, 125_000, 0.0875],
                 [125_001, Float::INFINITY, 0.099]],
        MARRIED: [[0, 7_300, 0.0475], [7_301, 18_400, 0.0675], [18_401, 250_000, 0.0875],
                  [250_001, Float::INFINITY, 0.099]]
      },

      PA: {
        SINGLE: [[0, Float::INFINITY, 0.0307]],
        MARRIED: [[0, Float::INFINITY, 0.0307]]
      },

      RI: {
        SINGLE: [[0, 66_200, 0.0375], [66_201, 150_550, 0.0475],
                 [150_551, Float::INFINITY, 0.0599]],
        MARRIED: [[0, 66_200, 0.0375], [66_201, 150_550, 0.0475],
                  [150_551, Float::INFINITY, 0.0599]]
      },

      SC: {
        SINGLE:  [[0, 3_070, 0], [3_071, 6_150, 0.03], [6_151, 9_230, 0.04],
                  [9_231, 12_310, 0.05], [12_311, 15_400, 0.06],
                  [15_401, Float::INFINITY, 0.07]],
        MARRIED:  [[0, 3_070, 0], [3_071, 6_150, 0.03], [6_151, 9_230, 0.04],
                   [9_231, 12_310, 0.05], [12_311, 15_400, 0.06],
                   [15_401, Float::INFINITY, 0.07]]
      },

      SD: {
        SINGLE: [[0, Float::INFINITY, 0]],
        MARRIED: [[0, Float::INFINITY, 0]]
      },

      TN: {
        SINGLE: [[0, Float::INFINITY, 0]],
        MARRIED: [[0, Float::INFINITY, 0]]
      },

      TX: {
        SINGLE: [[0, Float::INFINITY, 0]],
        MARRIED: [[0, Float::INFINITY, 0]]
      },

      UT: {
        SINGLE: [[0, Float::INFINITY, 0.0495]],
        MARRIED: [[0, Float::INFINITY, 0.0495]]
      },

      VA: {
        SINGLE: [[0, 3_000, 0.02], [3_001, 5_000, 0.03], [5_001, 17_000, 0.05],
                 [17_001, Float::INFINITY, 0.0575]],
        MARRIED: [[0, 3_000, 0.02], [3_001, 5_000, 0.03], [5_001, 17_000, 0.05],
                  [17_001, Float::INFINITY, 0.0575]]
      },

      VT: {
        SINGLE: [[0, 40_350, 0.0335], [40_351, 97_800, 0.066], [97_801, 204_000, 0.076],
                 [204_001, Float::INFINITY, 0.0875]],
        MARRIED: [[0, 67_450, 0.0335], [67_451, 163_000, 0.066], [163_001, 248_350, 0.076],
                  [248_351, Float::INFINITY, 0.0875]]
      },

      WA: {
        SINGLE: [[0, Float::INFINITY, 0]],
        MARRIED: [[0, Float::INFINITY, 0]]
      },

      WI: {
        SINGLE: [[0, 12_120, 0.0354], [12_121, 24_250, 0.0465], [24_251, 266_930, 0.0627],
                 [266_931, Float::INFINITY, 0.0765]],
        MARRIED: [[0, 16_160, 0.0354], [16_161, 32_330, 0.0465], [32_331, 355_910, 0.0627],
                  [355_911, Float::INFINITY, 0.0765]],
      },

      WV: {
        SINGLE: [[0, 10_000, 0.03], [10_001, 25_000, 0.04], [25_001, 40_000, 0.045],
                 [40_001, 60_000, 0.06], [60_001, Float::INFINITY, 0.065]],
        MARRIED: [[0, 10_000, 0.03], [10_001, 25_000, 0.04], [25_001, 40_000, 0.045],
                  [40_001, 60_000, 0.06], [60_001, Float::INFINITY, 0.065]]
      },

      WY: {
        SINGLE: [[0, Float::INFINITY, 0]],
        MARRIED: [[0, Float::INFINITY, 0]]
      }
    }
  end
end
