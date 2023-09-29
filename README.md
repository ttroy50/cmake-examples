<p align=center><b><a href="https://cmakebyexample.dev/">You're probably looking for cmakebyexample.dev 😉</a></b></p>

## Usage

Want to try one of these examples out for yourself locally? Just clone this
repository using `git clone` or `gh repo clone` and follow the directions in the
`index.md` file of the example you're interested in. Just don't forget to `cd`
into the example directory first!

```sh
gh repo clone jcbhmr/cmakebyexample.dev
cd cmakebyexample.dev
cd hello-world
cmake -B build
cmake --build build
./build/hello-world
```

## Development

Use `npm run dev` to spin up the Vitepress dev server.

Interesting links for development:

- https://vitepress.dev/guide/routing
- https://vitepress.dev/guide/asset-handling#the-public-directory
- https://vitepress.dev/guide/markdown#code-groups
- https://vitepress.dev/guide/markdown#import-code-snippets
- https://vitepress.dev/guide/extending-default-theme
