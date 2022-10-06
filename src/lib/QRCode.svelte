<script lang="ts">
  import { createEventDispatcher } from "svelte";
  import { writable } from "svelte/store";

  import { toDataURL } from "qrcode";
  import type { QRCodeToDataURLOptions } from "qrcode";

  // 输入属性
  export let text: string = "";
  export let opts: QRCodeToDataURLOptions = {
    type: "image/png",
    margin: 2,
    width: 240,
  };

  // 响应式
  const dataUrl = writable("");
  const dispatch = createEventDispatcher();
  $: {
    if (text) {
      toDataURL(text, opts).then((url) => {
        dataUrl.set(url);
        // 派发组件事件
        dispatch("ready", { url });
      });
    } else {
      dataUrl.set("");
    }
  }
</script>

<div class="qrcode">
  {#if $dataUrl}
    <img src={$dataUrl} alt="qrcode" />
  {/if}
</div>

<style>
  .qrcode {
    width: 240px;
    height: 240px;
    border: 2px solid #e8eaed;
    border-radius: 10px;
    background: #f1f3f4;
  }
  img {
    width: 100%;
    height: auto;
    border-radius: 10px;
  }
</style>
