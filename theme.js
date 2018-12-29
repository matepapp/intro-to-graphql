import {
  future
} from 'mdx-deck/themes'
import tomorrow from 'react-syntax-highlighter/styles/prism/tomorrow'
import graphql from 'react-syntax-highlighter/languages/prism/graphql'

const SCColor = '#ff3000'

export default {
  ...future,
  font: 'Lato',
  transitionTimingFunction: 'ease-in-out',
  transitionDuration: '0.6s',
  colors: {
    ...future.colors,
    text: 'white',
    background: 'black',
    link: SCColor,
  },
  h2: {
    textTransform: 'lowercase',
    padding: '10px 20px',
    backgroundColor: SCColor,
    color: 'white',
  },
  h3: {
    textTransform: 'none',
  },
  link: {
    textDecoration: 'none'
  },
  prism: {
    style: tomorrow,
    languages: {
      graphql: graphql
    }
  }
}