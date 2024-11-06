//
//  MockData.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import Foundation

// Assuming `CurrencyRatesResponseModel` is your Codable model
class MockData {
    static let currencyRatesResponse: CurrencyRatesResponseModel = {
        let jsonData = """
        {
          "success": true,
          "terms": "https://coinlayer.com/terms",
          "privacy": "https://coinlayer.com/privacy",
          "timestamp": 1529571067,
          "target": "USD",
          "rates": {
            "611": 0.389165,
            "ABC": 59.99,
            "ACP": 0.014931,
            "ACT": 0.15927,
            "ACT*": 0.14371,
            "ADA": 0.160502,
            "ADCN": 0.001406,
            "ADL": 121.5,
            "ADX": 0.427854,
            "ADZ": 0.02908,
            "AE": 2.551479,
            "AGI": 0.12555,
            "AIB": 0.005626,
            "AIDOC": 0.02605
          }
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CurrencyRatesResponseModel.self, from: jsonData)
            return decodedData
        } catch {
            fatalError("Failed to decode mock JSON data: \(error)")
        }
    }()
    
    static let favoritedRates: CurrencyRatesResponseModel = {
        let jsonData = """
        {
          "success": true,
          "terms": "https://coinlayer.com/terms",
          "privacy": "https://coinlayer.com/privacy",
          "timestamp": 1529571069,
          "target": "USD",
          "rates": {
            "611": 0.389165,
            "ABC": 59.99,
            "ACP": 0.014931,
            "ACT": 0.15927,
          }
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CurrencyRatesResponseModel.self, from: jsonData)
            return decodedData
        } catch {
            fatalError("Failed to decode mock JSON data: \(error)")
        }
    }()
    
    static let oldRatesResponse: CurrencyRatesResponseModel = {
        let jsonData = """
        {
          "success": true,
          "terms": "https://coinlayer.com/terms",
          "privacy": "https://coinlayer.com/privacy",
          "timestamp": 1730912827,
          "target": "USD",
          "rates": {
            "ABC": 59.99,
            "ACP": 0.014931,
            "ACT": 0.0017,
            "ACT*": 0.017178,
            "ADA": 0.35529,
            "ADCN": 0.00013,
            "ADL": 0.01515,
            "ADX": 0.16865,
            "ADZ": 0.0023,
            "AE": 0.020113,
            "AGI": 0.251,
            "AIB": 0.005626,
            "AIDOC": 0.004302,
            "AION": 0.001309,
            "AIR": 0.0058,
            "ALT": 0.602,
            "AMB": 0.006079,
            "AMM": 0.0033,
            "ANT": 1.5,
            "APC": 0.0017,
            "APPC": 0.00067,
            "ARC": 0.0169,
            "ARCT": 0.00061,
            "ARDR": 0.071458,
            "ARK": 0.577033,
            "ARN": 0.000849,
            "ASAFE2": 0.4,
            "AST": 0.080244,
            "ATB": 0.017,
            "ATM": 1.9,
            "AURS": 0.352867,
            "AVAX": 22.9,
            "AVT": 0.77,
            "BAR": 2.635,
            "BASH": 0.0056,
            "BAT": 0.164217,
            "BAY": 0.0644,
            "BBP": 0.0005,
            "BCD": 0.060342,
            "BCH": 371.242613,
            "BCN": 0.000134,
            "BCPT": 0.000926,
            "BEE": 1e-06,
            "BIO": 0.0008,
            "BLC": 0.072132,
            "BLOCK": 0.18,
            "BLU": 0.00054,
            "BLZ": 0.099106,
            "BMC": 0.002702,
            "BNB": 584.133012,
            "BNT": 0.540121,
            "BOST": 0.048,
            "BQ": 7.775e-05,
            "BQX": 2.720931,
            "BRD": 2.584721,
            "BRIT": 0.03,
            "BT1": 0,
            "BT2": 0,
            "BTC": 74499.100507,
            "BTCA": 0.00036,
            "BTCS": 0.01201,
            "BTCZ": 7.451085031967001e-05,
            "BTG": 22.110718,
            "BTLC": 9,
            "BTM": 0.078282,
            "BTM*": 0.122609,
            "BTQ": 0.01,
            "BTS": 0.001578,
            "BTX": 0.044068,
            "BURST": 0.017348,
            "CALC": 0.0006,
            "CAS": 0.007,
            "CAT": 2.66190093035075e-10,
            "CCRB": 0.08888,
            "CDT": 0.175693,
            "CESC": 0.0037,
            "CHAT": 1.18545,
            "CJ": 0.000898,
            "CL": 0.028,
            "CLD": 0.02,
            "CLOAK": 10,
            "CMT*": 0.03954,
            "CND": 0.000319,
            "CNX": 1.996594,
            "CPC": 0.0005,
            "CRAVE": 0.4,
            "CRC": 0.08475,
            "CRE": 1.316485,
            "CRW": 0.02202,
            "CTO": 0.005,
            "CTR": 0.000571,
            "CVC": 0.12462,
            "DAS": 0.937816,
            "DASH": 22.636086,
            "DAT": 0.001301,
            "DATA": 0,
            "DBC": 0.001921,
            "DBET": 0.027656,
            "DCN": 1.42e-06,
            "DCR": 10.709826,
            "DCT": 0.075256,
            "DEEP": 0.001,
            "DENT": 0.000864,
            "DGB": 0.00594,
            "DGD": 819.62567,
            "DIM": 9.4957e-05,
            "DIME": 3e-05,
            "DMD": 0.58782,
            "DNT": 0.04035,
            "DOGE": 0.193424,
            "DRGN": 0.026334,
            "DRZ": 3,
            "DSH": 252.13175,
            "DTA": 3.251722105057042e-06,
            "EC": 50,
            "EDG": 0.00231,
            "EDO": 0.61442,
            "EDR": 0.00023,
            "EKO": 7.451085031967001e-06,
            "ELA": 1.938,
            "ELF": 0.284005,
            "EMC": 0.081944,
            "EMGO": 0.43382,
            "ENG": 0.009683,
            "ENJ": 0.292631,
            "EOS": 0.44558,
            "ERT": 0.2054,
            "ETC": 19.115369,
            "ETH": 2651.777985,
            "ETN": 0.001988,
            "ETP": 0.003733,
            "ETT": 2.9,
            "EVR": 0.104931,
            "EVX": 0.002492,
            "FCT": 0.033062,
            "FLP": 0.015,
            "FOTA": 8.0043062160652e-05,
            "FRST": 0.78001,
            "FUEL": 22.071874,
            "FUN": 0.003131,
            "FUNC": 0.00061,
            "FUTC": 0.004,
            "GAME": 0.002981,
            "GAS": 3.752404,
            "GBYTE": 23.098364,
            "GMX": 54.5,
            "GNO": 218.74495,
            "GNT": 1.00052987847909e-08,
            "GNX": 0.000376,
            "GRC": 0.0067,
            "GRS": 10,
            "GRWI": 10000,
            "GTC": 0.636091,
            "GTO": 0.090308,
            "GUP": 0.023834,
            "GVT": 9.191731,
            "GXS": 1.067152,
            "HAC": 0.037255,
            "HNC": 0,
            "HSR": 10.831507,
            "HST": 0.0027,
            "HVN": 0.03529,
            "ICN": 0.145278,
            "ICOS": 17,
            "ICX": 0.126323,
            "IGNIS": 0.003802,
            "ILC": 0.098703,
            "INK": 0.000636,
            "INS": 1.839687,
            "INSN": 0.0473,
            "INT": 0.000316,
            "IOP": 15.455555,
            "IOST": 0.004742,
            "ITC": 0.021422,
            "KCS": 5.33,
            "KICK": 0.000324,
            "KIN": 1.3858e-05,
            "KLC": 0.000703,
            "KMD": 0.229695,
            "KNC": 0.437178,
            "KRB": 6,
            "LA": 0.019596,
            "LEND": 3.486467,
            "LEO": 6.004724,
            "LINDA": 0.000271,
            "LINK": 11.864096,
            "LOC": 0.12,
            "LOG": 0.060174,
            "LRC": 0.116301,
            "LSK": 0.794384,
            "LTC": 69.34681,
            "LUN": 0.015647,
            "LUX": 2.09e-06,
            "MAID": 0.377925,
            "MANA": 0.28698,
            "MCAP": 0.005398,
            "MCO": 0.845448,
            "MDA": 0.008705,
            "MDS": 0.000112,
            "MIOTA": 0.057987,
            "MKR": 1263.644,
            "MLN": 15.457,
            "MNX": 0.028649,
            "MOD": 0.240455,
            "MOIN": 0.033073,
            "MONA": 0.24022,
            "MTL": 0.926469,
            "MTN*": 0.009575,
            "MTX": 0.000701,
            "NAS": 0.004202,
            "NAV": 0.027975,
            "NBT": 0.001785,
            "NDC": 0.008989,
            "NEBL": 0.00256,
            "NEO": 9.667969,
            "NEU": 0.024194,
            "NEWB": 0.002604,
            "NGC": 0.027451,
            "NKC": 0.038763,
            "NLC2": 0.599935,
            "NMC": 5.867998,
            "NMR": 14.349548,
            "NULS": 0.30265,
            "NVC": 10,
            "NXT": 0.000722,
            "OAX": 0.138881,
            "OBITS": 0.015,
            "OC": 0.000407,
            "OCN": 3.642133269568811e-05,
            "ODN": 0.5,
            "OK": 0.008584,
            "OMG": 0.241825,
            "OMNI": 1.1,
            "ORE": 0,
            "ORME": 1.235715,
            "OST": 0.000166,
            "OTN": 0,
            "OTX": 0.023,
            "OXY": 0.0146,
            "PART": 3.951477,
            "PAY": 0.007579,
            "PBT": 36.288113,
            "PCS": 0.019961,
            "PIVX": 0.194332,
            "PIZZA": 0.001,
            "PLBT": 20,
            "PLR": 0.00311,
            "POE": 2.64841681022289e-06,
            "POLY": 0.1246,
            "POSW": 0.48712,
            "POWR": 0.203719,
            "PPC": 0.37,
            "PPT": 0.031295,
            "PPY": 5.45,
            "PRC": 3e-05,
            "PRES": 0.219998,
            "PRG": 1.427578,
            "PRL": 0.977395,
            "PRO": 0.8939,
            "PURA": 0.25,
            "PUT": 0,
            "QASH": 0.014151,
            "QAU": 0,
            "QSP": 0.001487,
            "QTUM": 2.124286,
            "QUN": 0.008318,
            "R": 0.01052,
            "RBIES": 1,
            "RCN": 0.000894,
            "RDD": 8.304467699167644e-05,
            "RDN": 0,
            "RDN*": 0.324446,
            "REBL": 0.000785,
            "REE": 1e-05,
            "REP": 0.26,
            "REQ": 0.10935,
            "REV": 1.34e-05,
            "RGC": 0.001,
            "RHOC": 0.178417,
            "RIYA": 0.090025,
            "RKC": 5,
            "RLC": 1.606795,
            "RPX": 0.061017,
            "RUFF": 0.000173,
            "SALT": 0.768708,
            "SAN": 0.031809,
            "SBC": 7,
            "SC": 0.005229,
            "SENT": 0.001,
            "SHIFT": 0,
            "SIB": 5.177,
            "SMART": 2.6e-05,
            "SMLY": 6e-05,
            "SMT*": 0.011226,
            "SNC": 0.03961,
            "SNGLS": 5.215799719351409e-05,
            "SNM": 0.001842,
            "SNT": 0.024113,
            "SOL": 186.33255,
            "SPK": 0.0084,
            "SRN": 6.70602821059467e-05,
            "STEEM": 0.168388,
            "STK": 0.078205,
            "STORJ": 0.444694,
            "STRAT": 0.63864,
            "STU": 0.00019,
            "STX": 2.0294,
            "SUB": 0.000135,
            "SUR": 0.01,
            "SWFTC": 0.002799,
            "SYS": 0.09416,
            "TAAS": 10,
            "TESLA": 0.019139,
            "THC": 0.000745,
            "THETA": 1.184627,
            "THS": 0.00171,
            "TIO": 0.085,
            "TKN": 0,
            "TKY": 0.000756,
            "TNB": 2.501324696197725e-05,
            "TNT": 0.009161,
            "TOA": 0.002397,
            "TRC": 6.2,
            "TRIG": 6.186747,
            "TRST": 0.04799,
            "TRUMP": 0.055,
            "TRX": 0.163633,
            "UBQ": 0.007451,
            "UNO": 13.4,
            "UNRC": 6e-05,
            "UQC": 8,
            "USDT": 1.001644,
            "UTK": 0.033744,
            "UTT": 0.001,
            "VEE": 0.004061,
            "VEN": 14.400304,
            "VERI": 23.736235,
            "VIA": 0.010432,
            "VIB": 0.053239,
            "VIBE": 0.00108,
            "VOISE": 0.00018,
            "VOX": 0.200108,
            "VRS": 0.1375,
            "VTC": 0.055714,
            "VUC": 9.9e-05,
            "WABI": 0.001701,
            "WAVES": 1.002744,
            "WAX": 0.0492,
            "WC": 0.045,
            "WGR": 6245670605.169319,
            "WINGS": 7.451085031967001e-06,
            "WLK": 0.0058,
            "WOP": 0.046453,
            "WPR": 0.04073,
            "WRC": 0.002301,
            "WTC": 0.004702,
            "XAUR": 0.10301,
            "XBP": 0.0027,
            "XBY": 0.2889,
            "XCP": 7.823639,
            "XCXT": 0.095658,
            "XDN": 2.372176200958622e-05,
            "XEM": 0.016227,
            "XGB": 0.0015,
            "XHI": 0.001325,
            "XID": 0.010924,
            "XLM": 0.096145,
            "XMR": 163.09832,
            "XNC": 0.00018,
            "XRB": 20.542692,
            "XRP": 0.532748,
            "XTO": 0.324858,
            "XTZ": 0.63584,
            "XUC": 0.00082,
            "XVG": 0.003733,
            "XZC": 4.96985,
            "YEE": 2.0010765540163e-06,
            "YOC": 0.00012,
            "YOYOW": 0.005959,
            "ZBC": 0.01006,
            "ZCL": 1.288269,
            "ZEC": 40.681116,
            "ZEN": 7.804053,
            "ZIL": 0.014241,
            "ZNY": 0.02,
            "ZRX": 0.310624,
            "ZSC": 4.439e-05,
            "611": 0.389165
          }
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CurrencyRatesResponseModel.self, from: jsonData)
            return decodedData
        } catch {
            fatalError("Failed to decode mock JSON data: \(error)")
        }
    }()
}