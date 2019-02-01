# Intro to GraphQL

An introductory presentation about GraphQL.

For demonstration purposes I created a very simple database and GraphQL API wrapper using [Prisma](https://prisma.io). You can try it out [here](https://eu1.prisma.sh/mate-papp-6c597a/intro-to-graphql/demo) in [GraphQL Playground](https://github.com/prisma/graphql-playground) or you can browse the source in the `prisma` folder.

Code highlighting supported by [code-surfer](https://github.com/pomber/code-surfer).

## Sources

- [Apollo's Blog](https://blog.apollographql.com)
- [How to GraphQL](https://www.howtographql.com/)
- [Prisma's Blog](https://www.prisma.io/blog)
- [GraphQL's official documentation](https://graphql.org)
- [Is GraphQL the future?](http://artsy.github.io/blog/2018/05/08/is-graphql-the-future/)
- [UIKonf 2017 – Martijn Walraven – Strong typing from the server to the UI with GraphQL](https://www.youtube.com/watch?v=MGHwJ-dH2Os&t=2s)
- [GraphQL Summit 2018 - Opening Keynote (Geoff Schmidt)](https://youtu.be/IjJkAL4RWyQ)

---

The presentation was generated with [mdx-deck][]'s `npm init deck` command.

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
