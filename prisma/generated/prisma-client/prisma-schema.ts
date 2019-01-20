export const typeDefs = /* GraphQL */ `type Account {
  id: ID!
  number: String!
  name: String!
  type: AccountType!
  currency: Currency!
  balance: Money!
  bookedTransactions: Money
  cards(where: CardWhereInput, orderBy: CardOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Card!]
}

type AccountConnection {
  pageInfo: PageInfo!
  edges: [AccountEdge]!
  aggregate: AggregateAccount!
}

input AccountCreateInput {
  number: String!
  name: String!
  type: AccountType!
  currency: Currency!
  balance: MoneyCreateOneInput!
  bookedTransactions: MoneyCreateOneInput
  cards: CardCreateManyWithoutAccountInput
}

input AccountCreateOneInput {
  create: AccountCreateInput
  connect: AccountWhereUniqueInput
}

input AccountCreateOneWithoutCardsInput {
  create: AccountCreateWithoutCardsInput
  connect: AccountWhereUniqueInput
}

input AccountCreateWithoutCardsInput {
  number: String!
  name: String!
  type: AccountType!
  currency: Currency!
  balance: MoneyCreateOneInput!
  bookedTransactions: MoneyCreateOneInput
}

type AccountEdge {
  node: Account!
  cursor: String!
}

enum AccountOrderByInput {
  id_ASC
  id_DESC
  number_ASC
  number_DESC
  name_ASC
  name_DESC
  type_ASC
  type_DESC
  currency_ASC
  currency_DESC
  createdAt_ASC
  createdAt_DESC
  updatedAt_ASC
  updatedAt_DESC
}

type AccountPreviousValues {
  id: ID!
  number: String!
  name: String!
  type: AccountType!
  currency: Currency!
}

type AccountSubscriptionPayload {
  mutation: MutationType!
  node: Account
  updatedFields: [String!]
  previousValues: AccountPreviousValues
}

input AccountSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: AccountWhereInput
  AND: [AccountSubscriptionWhereInput!]
  OR: [AccountSubscriptionWhereInput!]
  NOT: [AccountSubscriptionWhereInput!]
}

enum AccountType {
  SAVINGS
  CREDIT
  WEBCARD
  CURRENT
}

input AccountUpdateDataInput {
  number: String
  name: String
  type: AccountType
  currency: Currency
  balance: MoneyUpdateOneRequiredInput
  bookedTransactions: MoneyUpdateOneInput
  cards: CardUpdateManyWithoutAccountInput
}

input AccountUpdateInput {
  number: String
  name: String
  type: AccountType
  currency: Currency
  balance: MoneyUpdateOneRequiredInput
  bookedTransactions: MoneyUpdateOneInput
  cards: CardUpdateManyWithoutAccountInput
}

input AccountUpdateManyMutationInput {
  number: String
  name: String
  type: AccountType
  currency: Currency
}

input AccountUpdateOneInput {
  create: AccountCreateInput
  update: AccountUpdateDataInput
  upsert: AccountUpsertNestedInput
  delete: Boolean
  disconnect: Boolean
  connect: AccountWhereUniqueInput
}

input AccountUpdateOneRequiredInput {
  create: AccountCreateInput
  update: AccountUpdateDataInput
  upsert: AccountUpsertNestedInput
  connect: AccountWhereUniqueInput
}

input AccountUpdateOneWithoutCardsInput {
  create: AccountCreateWithoutCardsInput
  update: AccountUpdateWithoutCardsDataInput
  upsert: AccountUpsertWithoutCardsInput
  delete: Boolean
  disconnect: Boolean
  connect: AccountWhereUniqueInput
}

input AccountUpdateWithoutCardsDataInput {
  number: String
  name: String
  type: AccountType
  currency: Currency
  balance: MoneyUpdateOneRequiredInput
  bookedTransactions: MoneyUpdateOneInput
}

input AccountUpsertNestedInput {
  update: AccountUpdateDataInput!
  create: AccountCreateInput!
}

input AccountUpsertWithoutCardsInput {
  update: AccountUpdateWithoutCardsDataInput!
  create: AccountCreateWithoutCardsInput!
}

input AccountWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  number: String
  number_not: String
  number_in: [String!]
  number_not_in: [String!]
  number_lt: String
  number_lte: String
  number_gt: String
  number_gte: String
  number_contains: String
  number_not_contains: String
  number_starts_with: String
  number_not_starts_with: String
  number_ends_with: String
  number_not_ends_with: String
  name: String
  name_not: String
  name_in: [String!]
  name_not_in: [String!]
  name_lt: String
  name_lte: String
  name_gt: String
  name_gte: String
  name_contains: String
  name_not_contains: String
  name_starts_with: String
  name_not_starts_with: String
  name_ends_with: String
  name_not_ends_with: String
  type: AccountType
  type_not: AccountType
  type_in: [AccountType!]
  type_not_in: [AccountType!]
  currency: Currency
  currency_not: Currency
  currency_in: [Currency!]
  currency_not_in: [Currency!]
  balance: MoneyWhereInput
  bookedTransactions: MoneyWhereInput
  cards_every: CardWhereInput
  cards_some: CardWhereInput
  cards_none: CardWhereInput
  AND: [AccountWhereInput!]
  OR: [AccountWhereInput!]
  NOT: [AccountWhereInput!]
}

input AccountWhereUniqueInput {
  id: ID
  number: String
}

type AggregateAccount {
  count: Int!
}

type AggregateCard {
  count: Int!
}

type AggregateCategory {
  count: Int!
}

type AggregateMoney {
  count: Int!
}

type AggregateTransaction {
  count: Int!
}

type AggregateTransactionPartner {
  count: Int!
}

type BatchPayload {
  count: Long!
}

type Card {
  id: ID!
  number: String!
  name: String!
  holderName: String
  expiry: DateTime!
  account: Account
  cvc: String!
  limit: Int!
}

type CardConnection {
  pageInfo: PageInfo!
  edges: [CardEdge]!
  aggregate: AggregateCard!
}

input CardCreateInput {
  number: String!
  name: String!
  holderName: String
  expiry: DateTime!
  account: AccountCreateOneWithoutCardsInput
  cvc: String!
  limit: Int!
}

input CardCreateManyWithoutAccountInput {
  create: [CardCreateWithoutAccountInput!]
  connect: [CardWhereUniqueInput!]
}

input CardCreateOneInput {
  create: CardCreateInput
  connect: CardWhereUniqueInput
}

input CardCreateWithoutAccountInput {
  number: String!
  name: String!
  holderName: String
  expiry: DateTime!
  cvc: String!
  limit: Int!
}

type CardEdge {
  node: Card!
  cursor: String!
}

enum CardOrderByInput {
  id_ASC
  id_DESC
  number_ASC
  number_DESC
  name_ASC
  name_DESC
  holderName_ASC
  holderName_DESC
  expiry_ASC
  expiry_DESC
  cvc_ASC
  cvc_DESC
  limit_ASC
  limit_DESC
  createdAt_ASC
  createdAt_DESC
  updatedAt_ASC
  updatedAt_DESC
}

type CardPreviousValues {
  id: ID!
  number: String!
  name: String!
  holderName: String
  expiry: DateTime!
  cvc: String!
  limit: Int!
}

input CardScalarWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  number: String
  number_not: String
  number_in: [String!]
  number_not_in: [String!]
  number_lt: String
  number_lte: String
  number_gt: String
  number_gte: String
  number_contains: String
  number_not_contains: String
  number_starts_with: String
  number_not_starts_with: String
  number_ends_with: String
  number_not_ends_with: String
  name: String
  name_not: String
  name_in: [String!]
  name_not_in: [String!]
  name_lt: String
  name_lte: String
  name_gt: String
  name_gte: String
  name_contains: String
  name_not_contains: String
  name_starts_with: String
  name_not_starts_with: String
  name_ends_with: String
  name_not_ends_with: String
  holderName: String
  holderName_not: String
  holderName_in: [String!]
  holderName_not_in: [String!]
  holderName_lt: String
  holderName_lte: String
  holderName_gt: String
  holderName_gte: String
  holderName_contains: String
  holderName_not_contains: String
  holderName_starts_with: String
  holderName_not_starts_with: String
  holderName_ends_with: String
  holderName_not_ends_with: String
  expiry: DateTime
  expiry_not: DateTime
  expiry_in: [DateTime!]
  expiry_not_in: [DateTime!]
  expiry_lt: DateTime
  expiry_lte: DateTime
  expiry_gt: DateTime
  expiry_gte: DateTime
  cvc: String
  cvc_not: String
  cvc_in: [String!]
  cvc_not_in: [String!]
  cvc_lt: String
  cvc_lte: String
  cvc_gt: String
  cvc_gte: String
  cvc_contains: String
  cvc_not_contains: String
  cvc_starts_with: String
  cvc_not_starts_with: String
  cvc_ends_with: String
  cvc_not_ends_with: String
  limit: Int
  limit_not: Int
  limit_in: [Int!]
  limit_not_in: [Int!]
  limit_lt: Int
  limit_lte: Int
  limit_gt: Int
  limit_gte: Int
  AND: [CardScalarWhereInput!]
  OR: [CardScalarWhereInput!]
  NOT: [CardScalarWhereInput!]
}

type CardSubscriptionPayload {
  mutation: MutationType!
  node: Card
  updatedFields: [String!]
  previousValues: CardPreviousValues
}

input CardSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: CardWhereInput
  AND: [CardSubscriptionWhereInput!]
  OR: [CardSubscriptionWhereInput!]
  NOT: [CardSubscriptionWhereInput!]
}

input CardUpdateDataInput {
  number: String
  name: String
  holderName: String
  expiry: DateTime
  account: AccountUpdateOneWithoutCardsInput
  cvc: String
  limit: Int
}

input CardUpdateInput {
  number: String
  name: String
  holderName: String
  expiry: DateTime
  account: AccountUpdateOneWithoutCardsInput
  cvc: String
  limit: Int
}

input CardUpdateManyDataInput {
  number: String
  name: String
  holderName: String
  expiry: DateTime
  cvc: String
  limit: Int
}

input CardUpdateManyMutationInput {
  number: String
  name: String
  holderName: String
  expiry: DateTime
  cvc: String
  limit: Int
}

input CardUpdateManyWithoutAccountInput {
  create: [CardCreateWithoutAccountInput!]
  delete: [CardWhereUniqueInput!]
  connect: [CardWhereUniqueInput!]
  disconnect: [CardWhereUniqueInput!]
  update: [CardUpdateWithWhereUniqueWithoutAccountInput!]
  upsert: [CardUpsertWithWhereUniqueWithoutAccountInput!]
  deleteMany: [CardScalarWhereInput!]
  updateMany: [CardUpdateManyWithWhereNestedInput!]
}

input CardUpdateManyWithWhereNestedInput {
  where: CardScalarWhereInput!
  data: CardUpdateManyDataInput!
}

input CardUpdateOneInput {
  create: CardCreateInput
  update: CardUpdateDataInput
  upsert: CardUpsertNestedInput
  delete: Boolean
  disconnect: Boolean
  connect: CardWhereUniqueInput
}

input CardUpdateWithoutAccountDataInput {
  number: String
  name: String
  holderName: String
  expiry: DateTime
  cvc: String
  limit: Int
}

input CardUpdateWithWhereUniqueWithoutAccountInput {
  where: CardWhereUniqueInput!
  data: CardUpdateWithoutAccountDataInput!
}

input CardUpsertNestedInput {
  update: CardUpdateDataInput!
  create: CardCreateInput!
}

input CardUpsertWithWhereUniqueWithoutAccountInput {
  where: CardWhereUniqueInput!
  update: CardUpdateWithoutAccountDataInput!
  create: CardCreateWithoutAccountInput!
}

input CardWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  number: String
  number_not: String
  number_in: [String!]
  number_not_in: [String!]
  number_lt: String
  number_lte: String
  number_gt: String
  number_gte: String
  number_contains: String
  number_not_contains: String
  number_starts_with: String
  number_not_starts_with: String
  number_ends_with: String
  number_not_ends_with: String
  name: String
  name_not: String
  name_in: [String!]
  name_not_in: [String!]
  name_lt: String
  name_lte: String
  name_gt: String
  name_gte: String
  name_contains: String
  name_not_contains: String
  name_starts_with: String
  name_not_starts_with: String
  name_ends_with: String
  name_not_ends_with: String
  holderName: String
  holderName_not: String
  holderName_in: [String!]
  holderName_not_in: [String!]
  holderName_lt: String
  holderName_lte: String
  holderName_gt: String
  holderName_gte: String
  holderName_contains: String
  holderName_not_contains: String
  holderName_starts_with: String
  holderName_not_starts_with: String
  holderName_ends_with: String
  holderName_not_ends_with: String
  expiry: DateTime
  expiry_not: DateTime
  expiry_in: [DateTime!]
  expiry_not_in: [DateTime!]
  expiry_lt: DateTime
  expiry_lte: DateTime
  expiry_gt: DateTime
  expiry_gte: DateTime
  account: AccountWhereInput
  cvc: String
  cvc_not: String
  cvc_in: [String!]
  cvc_not_in: [String!]
  cvc_lt: String
  cvc_lte: String
  cvc_gt: String
  cvc_gte: String
  cvc_contains: String
  cvc_not_contains: String
  cvc_starts_with: String
  cvc_not_starts_with: String
  cvc_ends_with: String
  cvc_not_ends_with: String
  limit: Int
  limit_not: Int
  limit_in: [Int!]
  limit_not_in: [Int!]
  limit_lt: Int
  limit_lte: Int
  limit_gt: Int
  limit_gte: Int
  AND: [CardWhereInput!]
  OR: [CardWhereInput!]
  NOT: [CardWhereInput!]
}

input CardWhereUniqueInput {
  id: ID
  number: String
}

type Category {
  id: ID!
  name: String!
}

type CategoryConnection {
  pageInfo: PageInfo!
  edges: [CategoryEdge]!
  aggregate: AggregateCategory!
}

input CategoryCreateInput {
  name: String!
}

input CategoryCreateOneInput {
  create: CategoryCreateInput
  connect: CategoryWhereUniqueInput
}

type CategoryEdge {
  node: Category!
  cursor: String!
}

enum CategoryOrderByInput {
  id_ASC
  id_DESC
  name_ASC
  name_DESC
  createdAt_ASC
  createdAt_DESC
  updatedAt_ASC
  updatedAt_DESC
}

type CategoryPreviousValues {
  id: ID!
  name: String!
}

type CategorySubscriptionPayload {
  mutation: MutationType!
  node: Category
  updatedFields: [String!]
  previousValues: CategoryPreviousValues
}

input CategorySubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: CategoryWhereInput
  AND: [CategorySubscriptionWhereInput!]
  OR: [CategorySubscriptionWhereInput!]
  NOT: [CategorySubscriptionWhereInput!]
}

input CategoryUpdateDataInput {
  name: String
}

input CategoryUpdateInput {
  name: String
}

input CategoryUpdateManyMutationInput {
  name: String
}

input CategoryUpdateOneInput {
  create: CategoryCreateInput
  update: CategoryUpdateDataInput
  upsert: CategoryUpsertNestedInput
  delete: Boolean
  disconnect: Boolean
  connect: CategoryWhereUniqueInput
}

input CategoryUpsertNestedInput {
  update: CategoryUpdateDataInput!
  create: CategoryCreateInput!
}

input CategoryWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  name: String
  name_not: String
  name_in: [String!]
  name_not_in: [String!]
  name_lt: String
  name_lte: String
  name_gt: String
  name_gte: String
  name_contains: String
  name_not_contains: String
  name_starts_with: String
  name_not_starts_with: String
  name_ends_with: String
  name_not_ends_with: String
  AND: [CategoryWhereInput!]
  OR: [CategoryWhereInput!]
  NOT: [CategoryWhereInput!]
}

input CategoryWhereUniqueInput {
  id: ID
}

enum Currency {
  EUR
  USD
  GBP
  AUD
  BGN
  CAD
  CHF
  CNY
  CZK
  DKK
  HRK
  HUF
  JPY
  NOK
  PLN
  RON
  RSD
  RUB
  SEK
  TRY
  UAH
  ZAR
  MXN
}

scalar DateTime

scalar Long

type Money {
  amount: Float!
  currency: Currency!
}

type MoneyConnection {
  pageInfo: PageInfo!
  edges: [MoneyEdge]!
  aggregate: AggregateMoney!
}

input MoneyCreateInput {
  amount: Float!
  currency: Currency!
}

input MoneyCreateOneInput {
  create: MoneyCreateInput
}

type MoneyEdge {
  node: Money!
  cursor: String!
}

enum MoneyOrderByInput {
  amount_ASC
  amount_DESC
  currency_ASC
  currency_DESC
  id_ASC
  id_DESC
  createdAt_ASC
  createdAt_DESC
  updatedAt_ASC
  updatedAt_DESC
}

type MoneyPreviousValues {
  amount: Float!
  currency: Currency!
}

type MoneySubscriptionPayload {
  mutation: MutationType!
  node: Money
  updatedFields: [String!]
  previousValues: MoneyPreviousValues
}

input MoneySubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: MoneyWhereInput
  AND: [MoneySubscriptionWhereInput!]
  OR: [MoneySubscriptionWhereInput!]
  NOT: [MoneySubscriptionWhereInput!]
}

input MoneyUpdateDataInput {
  amount: Float
  currency: Currency
}

input MoneyUpdateManyMutationInput {
  amount: Float
  currency: Currency
}

input MoneyUpdateOneInput {
  create: MoneyCreateInput
  update: MoneyUpdateDataInput
  upsert: MoneyUpsertNestedInput
  delete: Boolean
  disconnect: Boolean
}

input MoneyUpdateOneRequiredInput {
  create: MoneyCreateInput
  update: MoneyUpdateDataInput
  upsert: MoneyUpsertNestedInput
}

input MoneyUpsertNestedInput {
  update: MoneyUpdateDataInput!
  create: MoneyCreateInput!
}

input MoneyWhereInput {
  amount: Float
  amount_not: Float
  amount_in: [Float!]
  amount_not_in: [Float!]
  amount_lt: Float
  amount_lte: Float
  amount_gt: Float
  amount_gte: Float
  currency: Currency
  currency_not: Currency
  currency_in: [Currency!]
  currency_not_in: [Currency!]
  AND: [MoneyWhereInput!]
  OR: [MoneyWhereInput!]
  NOT: [MoneyWhereInput!]
}

type Mutation {
  createAccount(data: AccountCreateInput!): Account!
  updateAccount(data: AccountUpdateInput!, where: AccountWhereUniqueInput!): Account
  updateManyAccounts(data: AccountUpdateManyMutationInput!, where: AccountWhereInput): BatchPayload!
  upsertAccount(where: AccountWhereUniqueInput!, create: AccountCreateInput!, update: AccountUpdateInput!): Account!
  deleteAccount(where: AccountWhereUniqueInput!): Account
  deleteManyAccounts(where: AccountWhereInput): BatchPayload!
  createCard(data: CardCreateInput!): Card!
  updateCard(data: CardUpdateInput!, where: CardWhereUniqueInput!): Card
  updateManyCards(data: CardUpdateManyMutationInput!, where: CardWhereInput): BatchPayload!
  upsertCard(where: CardWhereUniqueInput!, create: CardCreateInput!, update: CardUpdateInput!): Card!
  deleteCard(where: CardWhereUniqueInput!): Card
  deleteManyCards(where: CardWhereInput): BatchPayload!
  createCategory(data: CategoryCreateInput!): Category!
  updateCategory(data: CategoryUpdateInput!, where: CategoryWhereUniqueInput!): Category
  updateManyCategories(data: CategoryUpdateManyMutationInput!, where: CategoryWhereInput): BatchPayload!
  upsertCategory(where: CategoryWhereUniqueInput!, create: CategoryCreateInput!, update: CategoryUpdateInput!): Category!
  deleteCategory(where: CategoryWhereUniqueInput!): Category
  deleteManyCategories(where: CategoryWhereInput): BatchPayload!
  createMoney(data: MoneyCreateInput!): Money!
  updateManyMoneys(data: MoneyUpdateManyMutationInput!, where: MoneyWhereInput): BatchPayload!
  deleteManyMoneys(where: MoneyWhereInput): BatchPayload!
  createTransaction(data: TransactionCreateInput!): Transaction!
  updateTransaction(data: TransactionUpdateInput!, where: TransactionWhereUniqueInput!): Transaction
  updateManyTransactions(data: TransactionUpdateManyMutationInput!, where: TransactionWhereInput): BatchPayload!
  upsertTransaction(where: TransactionWhereUniqueInput!, create: TransactionCreateInput!, update: TransactionUpdateInput!): Transaction!
  deleteTransaction(where: TransactionWhereUniqueInput!): Transaction
  deleteManyTransactions(where: TransactionWhereInput): BatchPayload!
  createTransactionPartner(data: TransactionPartnerCreateInput!): TransactionPartner!
  updateTransactionPartner(data: TransactionPartnerUpdateInput!, where: TransactionPartnerWhereUniqueInput!): TransactionPartner
  updateManyTransactionPartners(data: TransactionPartnerUpdateManyMutationInput!, where: TransactionPartnerWhereInput): BatchPayload!
  upsertTransactionPartner(where: TransactionPartnerWhereUniqueInput!, create: TransactionPartnerCreateInput!, update: TransactionPartnerUpdateInput!): TransactionPartner!
  deleteTransactionPartner(where: TransactionPartnerWhereUniqueInput!): TransactionPartner
  deleteManyTransactionPartners(where: TransactionPartnerWhereInput): BatchPayload!
}

enum MutationType {
  CREATED
  UPDATED
  DELETED
}

interface Node {
  id: ID!
}

type PageInfo {
  hasNextPage: Boolean!
  hasPreviousPage: Boolean!
  startCursor: String
  endCursor: String
}

type Query {
  account(where: AccountWhereUniqueInput!): Account
  accounts(where: AccountWhereInput, orderBy: AccountOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Account]!
  accountsConnection(where: AccountWhereInput, orderBy: AccountOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): AccountConnection!
  card(where: CardWhereUniqueInput!): Card
  cards(where: CardWhereInput, orderBy: CardOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Card]!
  cardsConnection(where: CardWhereInput, orderBy: CardOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): CardConnection!
  category(where: CategoryWhereUniqueInput!): Category
  categories(where: CategoryWhereInput, orderBy: CategoryOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Category]!
  categoriesConnection(where: CategoryWhereInput, orderBy: CategoryOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): CategoryConnection!
  moneys(where: MoneyWhereInput, orderBy: MoneyOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Money]!
  moneysConnection(where: MoneyWhereInput, orderBy: MoneyOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): MoneyConnection!
  transaction(where: TransactionWhereUniqueInput!): Transaction
  transactions(where: TransactionWhereInput, orderBy: TransactionOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Transaction]!
  transactionsConnection(where: TransactionWhereInput, orderBy: TransactionOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): TransactionConnection!
  transactionPartner(where: TransactionPartnerWhereUniqueInput!): TransactionPartner
  transactionPartners(where: TransactionPartnerWhereInput, orderBy: TransactionPartnerOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [TransactionPartner]!
  transactionPartnersConnection(where: TransactionPartnerWhereInput, orderBy: TransactionPartnerOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): TransactionPartnerConnection!
  node(id: ID!): Node
}

type Subscription {
  account(where: AccountSubscriptionWhereInput): AccountSubscriptionPayload
  card(where: CardSubscriptionWhereInput): CardSubscriptionPayload
  category(where: CategorySubscriptionWhereInput): CategorySubscriptionPayload
  money(where: MoneySubscriptionWhereInput): MoneySubscriptionPayload
  transaction(where: TransactionSubscriptionWhereInput): TransactionSubscriptionPayload
  transactionPartner(where: TransactionPartnerSubscriptionWhereInput): TransactionPartnerSubscriptionPayload
}

type Transaction {
  id: ID!
  number: String!
  date: DateTime!
  bookingDate: DateTime
  amount: Money!
  originalAmount: Money
  status: TransactionStatus!
  partner: TransactionPartner
  sourceAccount: Account
  targetAccount: Account!
  card: Card
  category: Category
}

type TransactionConnection {
  pageInfo: PageInfo!
  edges: [TransactionEdge]!
  aggregate: AggregateTransaction!
}

input TransactionCreateInput {
  number: String!
  date: DateTime!
  bookingDate: DateTime
  amount: MoneyCreateOneInput!
  originalAmount: MoneyCreateOneInput
  status: TransactionStatus!
  partner: TransactionPartnerCreateOneInput
  sourceAccount: AccountCreateOneInput
  targetAccount: AccountCreateOneInput!
  card: CardCreateOneInput
  category: CategoryCreateOneInput
}

type TransactionEdge {
  node: Transaction!
  cursor: String!
}

enum TransactionOrderByInput {
  id_ASC
  id_DESC
  number_ASC
  number_DESC
  date_ASC
  date_DESC
  bookingDate_ASC
  bookingDate_DESC
  status_ASC
  status_DESC
  createdAt_ASC
  createdAt_DESC
  updatedAt_ASC
  updatedAt_DESC
}

type TransactionPartner {
  id: ID!
  name: String!
  address: String!
}

type TransactionPartnerConnection {
  pageInfo: PageInfo!
  edges: [TransactionPartnerEdge]!
  aggregate: AggregateTransactionPartner!
}

input TransactionPartnerCreateInput {
  name: String!
  address: String!
}

input TransactionPartnerCreateOneInput {
  create: TransactionPartnerCreateInput
  connect: TransactionPartnerWhereUniqueInput
}

type TransactionPartnerEdge {
  node: TransactionPartner!
  cursor: String!
}

enum TransactionPartnerOrderByInput {
  id_ASC
  id_DESC
  name_ASC
  name_DESC
  address_ASC
  address_DESC
  createdAt_ASC
  createdAt_DESC
  updatedAt_ASC
  updatedAt_DESC
}

type TransactionPartnerPreviousValues {
  id: ID!
  name: String!
  address: String!
}

type TransactionPartnerSubscriptionPayload {
  mutation: MutationType!
  node: TransactionPartner
  updatedFields: [String!]
  previousValues: TransactionPartnerPreviousValues
}

input TransactionPartnerSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: TransactionPartnerWhereInput
  AND: [TransactionPartnerSubscriptionWhereInput!]
  OR: [TransactionPartnerSubscriptionWhereInput!]
  NOT: [TransactionPartnerSubscriptionWhereInput!]
}

input TransactionPartnerUpdateDataInput {
  name: String
  address: String
}

input TransactionPartnerUpdateInput {
  name: String
  address: String
}

input TransactionPartnerUpdateManyMutationInput {
  name: String
  address: String
}

input TransactionPartnerUpdateOneInput {
  create: TransactionPartnerCreateInput
  update: TransactionPartnerUpdateDataInput
  upsert: TransactionPartnerUpsertNestedInput
  delete: Boolean
  disconnect: Boolean
  connect: TransactionPartnerWhereUniqueInput
}

input TransactionPartnerUpsertNestedInput {
  update: TransactionPartnerUpdateDataInput!
  create: TransactionPartnerCreateInput!
}

input TransactionPartnerWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  name: String
  name_not: String
  name_in: [String!]
  name_not_in: [String!]
  name_lt: String
  name_lte: String
  name_gt: String
  name_gte: String
  name_contains: String
  name_not_contains: String
  name_starts_with: String
  name_not_starts_with: String
  name_ends_with: String
  name_not_ends_with: String
  address: String
  address_not: String
  address_in: [String!]
  address_not_in: [String!]
  address_lt: String
  address_lte: String
  address_gt: String
  address_gte: String
  address_contains: String
  address_not_contains: String
  address_starts_with: String
  address_not_starts_with: String
  address_ends_with: String
  address_not_ends_with: String
  AND: [TransactionPartnerWhereInput!]
  OR: [TransactionPartnerWhereInput!]
  NOT: [TransactionPartnerWhereInput!]
}

input TransactionPartnerWhereUniqueInput {
  id: ID
}

type TransactionPreviousValues {
  id: ID!
  number: String!
  date: DateTime!
  bookingDate: DateTime
  status: TransactionStatus!
}

enum TransactionStatus {
  IN_PROGRESS
  REJECTED
  FUTURE
  SUCCESSFUL
}

type TransactionSubscriptionPayload {
  mutation: MutationType!
  node: Transaction
  updatedFields: [String!]
  previousValues: TransactionPreviousValues
}

input TransactionSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: TransactionWhereInput
  AND: [TransactionSubscriptionWhereInput!]
  OR: [TransactionSubscriptionWhereInput!]
  NOT: [TransactionSubscriptionWhereInput!]
}

input TransactionUpdateInput {
  number: String
  date: DateTime
  bookingDate: DateTime
  amount: MoneyUpdateOneRequiredInput
  originalAmount: MoneyUpdateOneInput
  status: TransactionStatus
  partner: TransactionPartnerUpdateOneInput
  sourceAccount: AccountUpdateOneInput
  targetAccount: AccountUpdateOneRequiredInput
  card: CardUpdateOneInput
  category: CategoryUpdateOneInput
}

input TransactionUpdateManyMutationInput {
  number: String
  date: DateTime
  bookingDate: DateTime
  status: TransactionStatus
}

input TransactionWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  number: String
  number_not: String
  number_in: [String!]
  number_not_in: [String!]
  number_lt: String
  number_lte: String
  number_gt: String
  number_gte: String
  number_contains: String
  number_not_contains: String
  number_starts_with: String
  number_not_starts_with: String
  number_ends_with: String
  number_not_ends_with: String
  date: DateTime
  date_not: DateTime
  date_in: [DateTime!]
  date_not_in: [DateTime!]
  date_lt: DateTime
  date_lte: DateTime
  date_gt: DateTime
  date_gte: DateTime
  bookingDate: DateTime
  bookingDate_not: DateTime
  bookingDate_in: [DateTime!]
  bookingDate_not_in: [DateTime!]
  bookingDate_lt: DateTime
  bookingDate_lte: DateTime
  bookingDate_gt: DateTime
  bookingDate_gte: DateTime
  amount: MoneyWhereInput
  originalAmount: MoneyWhereInput
  status: TransactionStatus
  status_not: TransactionStatus
  status_in: [TransactionStatus!]
  status_not_in: [TransactionStatus!]
  partner: TransactionPartnerWhereInput
  sourceAccount: AccountWhereInput
  targetAccount: AccountWhereInput
  card: CardWhereInput
  category: CategoryWhereInput
  AND: [TransactionWhereInput!]
  OR: [TransactionWhereInput!]
  NOT: [TransactionWhereInput!]
}

input TransactionWhereUniqueInput {
  id: ID
  number: String
}
`