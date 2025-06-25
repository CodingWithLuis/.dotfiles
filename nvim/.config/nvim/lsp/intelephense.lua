return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "blade" },
    -- init_options = {
    --     licenceKey = get_intelephense_license()
    -- },
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
