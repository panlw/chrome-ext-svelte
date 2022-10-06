<script lang="ts">
  import { onMount } from "svelte";
  import QRCode from "./lib/QRCode.svelte";

  // get current tab's url
  async function getCurrentTab() {
    if (typeof chrome === "undefined" || typeof chrome.tabs === "undefined") {
      return { url: "" };
    }
    let queryOptions = { active: true, currentWindow: true };
    let [tab] = await chrome.tabs.query(queryOptions);
    return tab;
  }

  let url = "";
  onMount(() => {
    (async () => {
      const tab = await getCurrentTab();
      url = tab.url || "";
    })();
  });

  let dataURL = "";
  function updateDataURL(e: CustomEvent) {
    dataURL = e.detail.url;
  }
  function downloadQRCode() {
    dataURL && chrome.downloads?.download({ url: dataURL });
  }
</script>

<main>
  <div>
    <QRCode text={url} on:ready={updateDataURL} />
  </div>
  <div class="ux">
    <input class="url" type="url" bind:value={url} />
  </div>
  <div class="ux">
    <button on:click={downloadQRCode}>下载</button>
  </div>
</main>

<style>
  .ux {
    padding: 0.5rem;
    display: flex;
    align-items: center;
    justify-content: center;
  }
</style>
