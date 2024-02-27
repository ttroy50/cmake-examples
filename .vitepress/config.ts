import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  // Remove this once all links are valid. This is just so that CI passes and
  // the site gets deployed as-is to GitHub Pages.
  ignoreDeadLinks: true,

  // Surprised this isn't the default. 🤷‍♂️
  srcExclude: ["**/README.md", "**/CONTRIBUTING.md"],

  base: process.env.BASE_PATH,

  // https://vitejs.dev/config/
  vite: {},

  // https://vitepress.dev/guide/sitemap-generation
  sitemap: {
    hostname: "https://cmakebyexample.dev",
  },

  title: "CMake by Example",
  description: "Starter CMake examples",

  head: [
    // https://github.com/vuejs/vitepress/issues/560
    ["link", { rel: "icon", href: "/favicon.ico" }],

    // https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rel#license
    [
      "link",
      {
        rel: "license",
        href: "https://github.com/jcbhmr/cmakebyexample.dev/blob/main/LICENSE",
      },
    ],
  ],

  // https://vitepress.dev/reference/default-theme-config
  themeConfig: {
    logo: "/favicon.ico",

    // https://vitepress.dev/reference/default-theme-search#search
    // search: {
    //   provider: "local",
    // },

    socialLinks: [
      { icon: "github", link: "https://github.com/jcbhmr/cmakebyexample.dev" },
    ],

    outline: false,
    aside: false,

    // https://vitepress.dev/reference/default-theme-edit-link
    editLink: {
      pattern: "https://github.com/jcbhmr/cmakebyexample.dev/edit/main/:path",
    },

    // https://github.com/vuejs/vitepress/issues/1037
    footer: {
      message:
        'Released under the <a href="https://github.com/jcbhmr/cmakebyexample.dev/blob/main/LICENSE">0BSD License</a>.',
      copyright:
        'Copyright © 2023 <a href="https://jcbhmr.me/">Jacob Hummer</a>',
    },
  },
});
