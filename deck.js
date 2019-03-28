import welcome from './slides/00-welcome.mdx'
import mainConcepts from './slides/01-main-concepts.mdx'
import buildingBlocks from './slides/02-building-blocks.mdx'
import rest from './slides/03-rest.mdx'
import frontend from './slides/04-frontend.mdx'
import useCases from './slides/05-use-cases.mdx'
import prosAndCons from './slides/06-pros-and-cons.mdx'

export {
  components
}
from "mdx-deck-code-surfer"

export {
  theme
}
from './theme'

export default [
  ...welcome,
  ...mainConcepts,
  ...buildingBlocks,
  ...rest,
  ...frontend,
  ...useCases,
  ...prosAndCons
]