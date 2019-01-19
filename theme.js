import {
  future
} from 'mdx-deck/themes';
import oceanicNext from 'prism-react-renderer/themes/oceanicNext';

const SCColor = '#ff3000';

export const theme = {
  ...future,
  font: 'Lato',
  transitionTimingFunction: 'ease-in-out',
  colors: {
    ...future.colors,
    text: 'white',
    background: 'black',
    link: SCColor
  },
  h2: {
    textTransform: 'none',
    padding: '10px 20px',
    backgroundColor: SCColor,
    color: 'white'
  },
  h3: {
    textTransform: 'none'
  },
  link: {
    textDecoration: 'none'
  },
  codeSurfer: {
    ...oceanicNext,
    showNumbers: false
  }
};