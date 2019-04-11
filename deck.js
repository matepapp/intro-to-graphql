import welcome1 from './slides/part-1/00-welcome.mdx';
import mainConcepts from './slides/part-1/01-main-concepts.mdx';
import buildingBlocks from './slides/part-1/02-building-blocks.mdx';
import rest from './slides/part-1/03-rest.mdx';
import frontend from './slides/part-1/04-frontend.mdx';
import useCases from './slides/part-1/05-use-cases.mdx';
import prosAndCons1 from './slides/part-1/06-pros-and-cons.mdx';
import welcome2 from './slides/part-2/00-welcome.mdx';
import recap from './slides/part-2/01-recap.mdx';
import ios from './slides/part-2/02-ios.mdx';
import prosAndCons2 from './slides/part-2/03-pros-and-cons.mdx';
import references from './slides/part-2/04-references.mdx';

export { components } from 'mdx-deck-code-surfer';

export { theme } from './theme';

export default [
  ...welcome1,
  ...mainConcepts,
  ...buildingBlocks,
  ...rest,
  ...frontend,
  ...useCases,
  ...prosAndCons1,
  ...welcome2,
  ...recap,
  ...ios,
  ...prosAndCons2,
  ...references
];
