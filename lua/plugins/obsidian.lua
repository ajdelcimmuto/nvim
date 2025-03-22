require("obsidian").setup({
    dir = "~/Notes/SecondBrain",
    daily_notes = {
        folder = "Daily",
        date_format = "%Y-%m-%d"
    },
    completion = {
        nvim_cmp = true,
    },
    templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
    },
})
