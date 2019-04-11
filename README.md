# Intro to GraphQL

[![Netlify Status](https://api.netlify.com/api/v1/badges/f4115459-eefb-4f9e-a3c3-c9d658761bf8/deploy-status)](https://app.netlify.com/sites/intro-to-graphql/deploys)

2 part introductory presentation about GraphQL for iOS Developers (and anybody who is interested to learn something cool). Also it was a great chance to try out [mdx-deck](https://github.com/jxnblk/mdx-deck).

[Check it out live!](https://intro-to-graphql.matepapp.com/)

## Example

There's a small example app in [`example`](https://github.com/matepapp/intro-to-graphql/tree/master/example) folder. If you want to use it generate a Personal Access Token for Github and set the [`accessToken`](https://github.com/matepapp/intro-to-graphql/blob/f6e762dcc5f9304f61b8783581941c359cec8c27/example/nsbudapest-graphql/Apollo/Apollo.swift#L13) variable.

## References and sources

- [Apollo's Blog](https://blog.apollographql.com)
- [How to GraphQL](https://www.howtographql.com/)
- [Prisma's Blog](https://www.prisma.io/blog)
- [GraphQL's official documentation](https://graphql.org)
- [Is GraphQL the future?](http://artsy.github.io/blog/2018/05/08/is-graphql-the-future/)
- [UIKonf 2017 – Martijn Walraven – Strong typing from the server to the UI with GraphQL](https://www.youtube.com/watch?v=MGHwJ-dH2Os&t=2s)
- [GraphQL Summit 2018 - Opening Keynote (Geoff Schmidt)](https://youtu.be/IjJkAL4RWyQ)

---

The presentation was generated with [mdx-deck][]'s `npm init deck` command.

Code highlighting supported by [code-surfer](https://github.com/pomber/code-surfer).

## Development

To run the presentation deck in development mode:

```sh
npm start
```

## Exporting

To build the presentation deck as static HTML:

```sh
npm run build
```

To export a PDF:

```sh
npm run pdf
```

To export an image of the title slide:

```sh
npm run image
```

For more documentation see the [mdx-deck][] repo.

[mdx-deck]: https://github.com/jxnblk/mdx-deck
