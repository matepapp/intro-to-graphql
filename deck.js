import welcome from './00-welcome.mdx'
import mainConcepts from './01-main-concepts.mdx'
import buildingBlocks from './02-building-blocks.mdx'

export {
  components
}
from "mdx-deck-code-surfer"

export {
  theme
}
from './theme'

export default [...welcome, ...mainConcepts, ...buildingBlocks]