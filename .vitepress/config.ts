import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  // https://vitepress.dev/guide/routing
  // https://vitepress.dev/reference/site-config#srcdir
  srcDir: "src",

  // https://vitejs.dev/config/
  vite: {
    // Force-extract public folder to the root of the project, not the root of
    // the src (which it is by default in VitePress).
    // https://vitepress.dev/guide/asset-handling#the-public-directory
    // https://vitejs.dev/config/shared-options.html#publicdir
    publicDir: "../public",
  },

  // https://vitepress.dev/guide/sitemap-generation
  sitemap: {
    hostname: "https://cmakebyexample.dev",
  },
  lastUpdated: true,

  title: "CMake by Example",
  description: "Starter CMake examples",

  head: [
    // https://github.com/vuejs/vitepress/issues/560
    ["link", { rel: "icon", href: "/cmake-favicon.ico" }],

    // https://github.com/vuejs/vitepress/issues/1131
    // prettier-ignore
    ["script", { async: "", src: `https://www.googletagmanager.com/gtag/js?id=${process.env.GA_TRACKING_ID}` }],
    // prettier-ignore
    ["script", {}, `window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', '${process.env.GA_TRACKING_ID}');`],
  ],

  // https://vitepress.dev/reference/default-theme-config
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-search#search
    search: {
      provider: "local",
    },

    // https://vitepress.dev/reference/default-theme-edit-link
    editLink: {
      pattern:
        "https://github.com/jcbhmr/cmakebyexample.dev/edit/main/src/:path",
    },

    // Doesn't show when sidebar is present. This site relies on sidebar.
    // footer: {
    //   message: 'Released under the <a href="https://github.com/vuejs/vitepress/blob/main/LICENSE">MIT License</a>.',
    //   copyright: 'Copyright © 2019-present <a href="https://github.com/yyx990803">Evan You</a>'
    // },

    logo: "/cmake-favicon.ico",

    nav: [
      { text: "Home", link: "/" },
      { text: "Examples", link: "/hello-world/" },
      { text: "CMake.org", link: "https://cmake.org/" },
    ],

    sidebar: [
      { text: "Home", link: "/" },
      // { text: "CMake in GitHub Actions", link: "/github-actions.html" },

      {
        text: "Basic examples",
        items: [
          { text: "Hello world!", link: "/hello-world/" },
          { text: "Two executable targets", link: "/two-executables/" },
          { text: "Add an include folder", link: "/add-include-folder/" },
          { text: "CMakePresets.json", link: "/cmakepresets-json/" },
        ],
      },

      {
        text: "Advanced examples",
        items: [
          { text: "Using cpr via FetchContent", link: "/cpr-fetchcontent/" },
          { text: "Using {fmt} via CPM.cmake", link: "/fmt-cpm/" },
          { text: "Using GTest via Conan", link: "/gtest-conan/" },
          { text: "Using FTXUI via Vcpkg", link: "/ftxui-vcpkg/" },
        ],
      },

      { text: "CMake.org", link: "https://cmake.org/" },
      { text: "GitHub", link: "https://github.com/jcbhmr/cmakebyexample.dev" },
    ],

    socialLinks: [
      { icon: "github", link: "https://github.com/jcbhmr/cmakebyexample.dev" },
    ],
  },
});
