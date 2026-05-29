return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("minuet").setup({
        notify = "verbose",
        provider = "openai_compatible",
        -- Add these to ensure it triggers:
        search_context_window = 500,
        context_window = 1000,
        -- Optional but recommended for smoother ghost text
        throttle = 2000, -- wait 2s between requests
        debounce = 400,  -- wait 400ms after you stop typing to send request
        
        virtualtext = {
          auto_trigger_ft = { '*' },
          keymap = {
            accept = "<Tab>",
            accept_line = "<A-a>", -- Alt+a
            dismiss = "<A-e>",
          },
        },
        provider_options = {
          openai_compatible = {
            end_point = "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions",
            api_key = "QWEN_API_KEY",
            name = "DashScope",
            model = "qwen-plus",
            optional = {
              enable_thinking = false,
              max_tokens = 256,
              top_p = 0.9,
            },
          },
        },
      })
    end,
  },
}
