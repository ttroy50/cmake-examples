<!-- https://github.com/vuejs/vitepress/issues/800#issuecomment-1594473590 -->
<template>
  <div class="vp-doc container">
    <slot></slot>
  </div>
</template>

<style scoped>
.container {
  margin: auto;
  width: 100%;
  max-width: 1280px;
  padding: 0 24px;
}

@media (min-width: 640px) {
  .container {
    padding: 0 48px;
  }
}

@media (min-width: 960px) {
  .container {
    width: 100%;
    padding: 0 64px;
  }
}
</style>
