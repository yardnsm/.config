local utils = require("yardnsm.utils")

return {
  {
    "filipdutescu/renamer.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {
      min_width = 25,
      max_width = 45,
      with_popup = false,
      show_refs = true,
      with_qf_list = true,

      handler = function(results)
        local num_files = 0
        local num_updates = 0

        for _, v in ipairs(results.documentChanges) do
          num_files = num_files + 1
          num_updates = num_updates + #v.edits
        end

        utils.log(
          string.format(
            "[LSP] Renamed %s instance%s in %s file%s. %s",
            num_updates,
            num_updates == 1 and "" or "s",
            num_files,
            num_files == 1 and "" or "s",
            num_files > 1 and "To save them run ':cfdo w'" or ""
          )
        )

        if num_files > 1 then
          vim.cmd([[
            belowright copen
            wincmd p
          ]])
        end
      end,
    },
  },
}
