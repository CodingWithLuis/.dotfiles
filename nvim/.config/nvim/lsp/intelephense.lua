return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "blade" },
    init_options = {
        licenceKey = '/home/envy/intelephense/license.txt'
    },
    settings = {
        intelephense = {
            telemetry = { enabled = false },
            completion = { fullyQualifyGlobalConstantsAndFunctions = false },
            phpdoc = { returnVoid = false },
            files = {
                associations = { "*.php", "*.blade.php" },
                maxSize = 5000000,
            }
        }
    }
}
