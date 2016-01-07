class MBCSGroupProber: CharSetGroupProber {
    override init(langFilter: LanguageFilter = []) {
        super.init(langFilter: langFilter)
        self.probers = [
            UTF8Prober(),
            SJISProber(),
            EUCJPProber(),
            GB2312Prober(),
            EUCKRProber(),
            CP949Prober(),
            Big5Prober(),
            EUCTWProber()
        ]
        self.reset()
    }
}