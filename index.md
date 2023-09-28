---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: "<img src='/cmake-favicon.ico' style='display:inline'>CMake by example"
  tagline: From 'Hello world!' to a a CLI app

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
</style>

<!-- https://github.com/vuejs/vitepress/issues/800 -->
<script setup>
import HomeContent from '.vitepress/theme/components/HomeContent.vue';
</script>

<HomeContent>

## More resources

- [CMake Cookbook](https://github.com/dev-cafe/cmake-cookbook)

</HomeContent>
