---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: "<img src='/cmake-favicon.ico' style='display:inline'>CMake by example"
  tagline: From 'Hello world!' to your spaghetti monster

  image:
    src: /hero.png

  actions:
    - theme: brand
      text: Hello world!
      link: /hello-world/
    - theme: brand
      text: "{fmt} via CPM.cmake"
      link: /fmt-cpm/
    - theme: alt
      text: CMake.org
      link: https://cmake.org/

features:
  - title: <a href="/hello-world/">Hello world!</a>
  - title: <a href="/two-executables/">Two executable targets</a>
  - title: <a href="/cpr-fetchcontent/">Using cpr via FetchContent</a>
  - title: <a href="/fmt-cpm/">Using {fmt} via CPM.cmake</a>
  - title: <a href="/gtest-conan/">Using GTest via Conan</a>
  - title: <a href="/ftxui-vcpkg/">Using FTXUI via Vcpkg</a>
---

<style>
.VPHomeHero .action:nth-child(1) {
  --vp-button-brand-bg: green;
}

.VPHomeFeatures .title a {
  font-weight: 700;
  color: var(--vp-c-brand);
  border-bottom: 1px solid currentColor;
  transition: color 0.25s;
}
.VPHomeFeatures .title a:hover {
  color: var(--vp-c-brand-dark);
}

.vp-doc.container {
  padding-top: 1em;
}
.VPHome {
  padding-bottom: 1em !important;
}

#footer {
  padding-top: 0.66em;
  max-width: 800px;
  text-align: center;
  margin-inline: auto;
  font-size: smaller;
  line-height: 1.65;
  color: var(--vp-c-text-2);
}
#footer p {
  line-height: unset;
}
#footer a {
  color: unset;
  text-decoration: none;
  border-bottom: 1px dashed currentColor;
}

.emoji-font {
  font-family: system-ui, "Segoe UI", Roboto, Helvetica, Arial, sans-serif,
    "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}
</style>

<!-- https://github.com/vuejs/vitepress/issues/800 -->
<script setup>
import HomeContent from '.vitepress/theme/components/HomeContent.vue';
</script>

<HomeContent>

> CMake is the de-facto standard for building C++ code, with over 2 million
> downloads a month. It’s a powerful, comprehensive solution for managing the
> software build process.

&mdash; [CMake.org](https://cmake.org/)

<b>CMake by Example</b> is a hands-on introduction to CMake using annotated
example `CMakeLists.txt` projects. Click on any of the links above! You are
encouraged to copy-paste bits from these examples into your own projects as
needed.

## More resources

- [C/C++ by example](https://www.cbyexample.com/)
- [Makefile Tutorial by Example](https://makefiletutorial.com/)
- [CMake Cookbook](https://github.com/dev-cafe/cmake-cookbook)
- [CPM.cmake: CMake's missing package manager](https://github.com/cpm-cmake/CPM.cmake)
- [Conan: C/C++ Package Manager](https://conan.io/)
- [Vcpkg: C++ Library Manager](https://vcpkg.io/en/index.html)

<footer id="footer" >

<!-- prettier-ignore -->
Made with <span class="emoji-font">❤️</span> by [Jacob Hummer](https://jcbhmr.me/) \
Licensed under [CC0 1.0 Universal](https://github.com/jcbhmr/cmakebyexample.dev/blob/main/LICENSE) \
[Source code available on GitHub](https://github.com/jcbhmr/cmakebyexample.dev)

</footer>

</HomeContent>
