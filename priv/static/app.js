// Loaded with `defer` after hljs.js. The page reads fine without it: code is
// still monospace, and the copy buttons stay hidden instead of doing nothing.
if (window.hljs) hljs.highlightAll();

document.querySelectorAll("[data-copy]").forEach((button) => {
  const block = button.closest("[data-copy-block]");
  const code = block.querySelector("code");
  const status = block.querySelector("[data-copy-status]");

  button.hidden = false;

  button.addEventListener("click", async () => {
    try {
      await navigator.clipboard.writeText(code.textContent.trim());
      report(button, status, "copied", "Copied to clipboard.");
    } catch {
      // Clipboard access can be denied; select the text so the user can copy it.
      const range = document.createRange();
      range.selectNodeContents(code);
      const selection = window.getSelection();
      selection.removeAllRanges();
      selection.addRange(range);
      report(button, status, "selected", "Could not copy. The commands are selected; press Ctrl+C or ⌘C.");
    }
  });
});

function report(button, status, label, message) {
  button.textContent = label;
  status.textContent = message;
  clearTimeout(button.resetTimer);
  button.resetTimer = setTimeout(() => {
    button.textContent = "copy";
    status.textContent = "";
  }, 2500);
}
