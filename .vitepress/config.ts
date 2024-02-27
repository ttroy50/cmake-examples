import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  // FIXME
  ignoreDeadLinks: true,

  title: "CMake by Example",
  description: "Starter CMake examples",

  // https://github.com/vuejs/vitepress/issues/3508
  base: process.env.BASE_PATH,

  sitemap: {
    hostname: "https://cmakebyexample.dev",
  },

  head: [
    // https://github.com/vuejs/vitepress/issues/560
    ["link", { rel: "icon", href: "/favicon.ico" }],
  ],

  // https://vitepress.dev/reference/default-theme-config
  themeConfig: {
    logo: "/favicon.ico",

    socialLinks: [
      { icon: "github", link: "https://github.com/jcbhmr/cmakebyexample.dev" },
    ],

    outline: false,
    aside: false,

    // https://vitepress.dev/reference/default-theme-edit-link
    editLink: {
      pattern: "https://github.com/jcbhmr/cmakebyexample.dev/edit/main/:path",
    },

    footer: {
      message:
        'Released under the <a href="https://github.com/jcbhmr/cmakebyexample.dev/blob/main/LICENSE">0BSD License</a>.',
      copyright:
        'Copyright © 2023 <a href="https://jcbhmr.me/">Jacob Hummer</a>',
    },
  },
});
