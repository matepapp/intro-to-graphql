import welcome from './slides/00-welcome.mdx'
import mainConcepts from './slides/01-main-concepts.mdx'
import buildingBlocks from './slides/02-building-blocks.mdx'
import rest from './slides/03-rest.mdx'
import practicalExample from './slides/04-practical-example.mdx'

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
  ...practicalExample
]