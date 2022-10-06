# Chrome Extension - QRCode

## License

[MIT License](./LICENSE): https://mit-license.org

## Reference

- [使用Svelte开发Chrome Extension](https://mp.weixin.qq.com/s?__biz=MzkxNTIwMzU5OQ==&mid=2247493868&idx=1&sn=0d32a35b789018cda1bfbf0fdd0579d1&chksm=c1601b8cf617929af4c82e06f28e07fb78e617b6dac46edb2cefb7107f688799fe09b01f8897&mpshare=1&scene=1)
- [Svelte](https://svelte.dev/)
- [Vite](https://cn.vitejs.dev/)
- [TypeScript](https://www.typescriptlang.org/zh/)

> NOTICE: SPA by [SvelteKit](https://kit.svelte.dev/) is not supportted now.

## Create Project

```shell
pnpm create vite # svelte, ts
cd chrome-ext-svelte
pnpm i
pnpm i -D qrcode @types/qrcode @types/chrome
```

## Deploy Project

```shell deploy.sh
#!/bin/sh

basedir=~/Documents/chrome-exts
ext_dir=${basedir}/qrcode

rm -rf ${ext_dir} \
    && cp -pr dist ${ext_dir} \
    && cp -p manifest.json ${ext_dir}
```

```json package.json
{
    ...
    "build": "vite build && . deploy.sh",
    ...
}
```
