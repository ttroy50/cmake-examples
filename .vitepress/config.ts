import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  // https://vitejs.dev/config/
  vite: {},

  title: "CMake by Example",
  description: "Starter CMake examples",

  head: [["link", { rel: "icon", href: "/cmake-favicon.ico" }]],

  // https://vitepress.dev/reference/default-theme-config
  themeConfig: {
    logo: "/cmake-favicon.ico",

    nav: [
      { text: "Home", link: "/" },
      { text: "Examples", link: "/hello-world/" },
      { text: "CMake.org", link: "https://cmake.org/" },
    ],

    sidebar: [
      { text: "Home", link: "/" },
      { text: "CMake in GitHub Actions", link: "/github-actions.html" },

      // prettier-ignore
      { text: "Examples", items: [
        { text: "Hello world!", link: "/hello-world/" },
        { text: "Two executable targets", link: "/two-executables/" },
        { text: "Using cpr via FetchContent", link: "/cpr-fetchcontent/" },
        { text: "Using {fmt} via CPM.cmake", link: "/fmt-cpm/" },
        { text: "Using GTest via Conan", link: "/gtest-conan/" },
        { text: "Using FTXUI via Vcpkg", link: "/ftxui-vcpkg/" },
      ] },

      { text: "CMake.org", link: "https://cmake.org/" },
      { text: "GitHub", link: "https://github.com/jcbhmr/cmakebyexample.dev" },
    ],

    socialLinks: [
      { icon: "github", link: "https://github.com/jcbhmr/cmakebyexample.dev" },
    ],
  },
});
