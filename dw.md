# Resumo de DataWarehousing

No quotidiano de uma organização é usual tomarem-se decisões, qualquer que seja o seu ramo de atividade.

Os intervenientes – agentes de decisão – munem-se dos argumentos mais pertinentes para justificarem a sua opção. A tomada de decisões não é um processo fácil

Um agente de decisão não tem a priori uma agenda definida de queries ou de relatórios definidos.

A forma como explora a informação segue a sua intuição, e a sua continuação, bem como a sua linha de investigação, obedece em grande medida aos resultados que uma (ou mais) das suas queries anteriores fez despoletar.

## Arquiteturas de DW

### Single-Layer Architecture

Não é muito usada na prática. O objetivo é minimizar o tamanho de dados armazenados.  A source layer é a única camada física disponível e os datawarehouses são virtuais. Significa que o data warehouse é implementado como uma vista multidimensional dos dados originais e que é criada por um middleware. A fraqueza é o facto de não separar os processos transacionais dos processos de análise e, além disso, as queries de análise afetam e sobrecarregam a base de dados original e, por isso, prejudicam as transações. Só é boa ideia se a análise é muito restrita e o volume de dados é enorme.

### Two-Layer Architecture

Duas camadas para mostrar a evidência entre as fontes de dados e os datawarehouses. Na verdade, consiste em 4 estados de fluxo de dados.

**Data Marts** subconjunto ou agregação dos dados armazenados num datawarehouse principal. Inclui um conjunto de informações relevantes para uma área de negócios específica, departamento ou conjunto de utilizadores. Marcam a informação necessária para resolver queries, melhor performance porque são mais pequenos que os datawarehouses principais e desenvolvem incrementalmente datawarehouses. O DW pode conter vários Data Marts, ou seja, a sua construção pode se realizar a artir do surgimento de vários Data Marts.

### Three-Layer Architecture

Nesta arquitectura, a terceira camada é a camada de dados de reconciliação. Esta camada materializa dados operacionais obtidos depois de integração e limpeza das fontes de dados. Por isso, estes dados são integrados, consistentes, corretos e detalhados. A principal vantagem é que cria uma referência de dados comum para todo o negócio e, ao mesmo tempo, separa os problemas da extração e integração de dados dos problemas de população do datawarehouses. Em alguns casos, esta camada é diretamente usada para algumas tarefas como produzir relatórios diários...

## Modelação Concetual

**Facto** é um conceito relevante para o processo de tomada de decisão. Tipicamente modela um conjunto de eventos que têm lugar dentro de uma empresa. Ex: vendas, envios, compras...

**Medida** propriedade numérica de um facto e descreve um aspeto do facto que é quantitativo e que é relevante para a análise; Exemplo: cada venda é medida pelo número de unidades vendidas, preço da unidade e total recebido. A razão para as medidas serem preferencialmente numéricas é porque são normalmente usadas para fazer cálculos. Um facto pode não ter medidas se estamos apenas interessados em registar apenas a ocorrência de um evento.

**Dimensão** propriedade de um facto com um domínio finito e que descreve uma coordenada de análise do facto. Um facto, geralmente, tem mais dimensões que definem a sua granularidade mínima de representação. Neste caso, a informação básica que pode ser representada é vendas de produtos numa loja num dia. Neste nível de granularidade, não é possível distinguir entre vendas feitas pelos diferentes empregados ou em diferentes horas do dia. Como os factos são dinâmicos, um esquema de factos tem certamente, pelo menos, uma dimensão temporal cuja granularidade pode variar do minuto até ao mês, ano, etc...

**Evento primário** ocorrência particular de um facto.  Um valor para cada medida é associado a cada evento principal e é identificado by one n-ple made up of a value for each dimension. Exemplo: 10 pacotes de detergente foram vendidos por 25€ no dia 10/10/2008 no Continente. Um facto exprime um relacionamento N-N com as dimensões;

**Atributo dimensional** atributo da dimensão;

**Evento secundário** dado um conjunto de atributos dimensionais (geralmente associados a diferentes hierarquias), cada conjunto dos valores deles, identifica um evento secundário que agrega todos os eventos primários correspondentes. Exemplo: vendas podem ser agrupadas em categoria, mês e cidade da loja... Por isso, o conjunto (cidade Braga, produto Detergente, mês 10/2008) identifica um evento secundário que agrega todas as vendas de outubro de 2008 do produto Detergente em Braga.

**Atributos descritivos** atributos que não dão para agregar... são atributos dimensionais de uma hierarquia que especificam uma propriedade de um atributo.

**Hierarquia** árvore direcionada cujos nós são atributos dimensionais e cujos arcos são relacionamentos 1-N entre os atributos dimensionais. A definição de hierarquias numa dimensão permite indicar os caminhos de agregação/desagregação que se podem seguir. Uma hierarquia define uma sequência lógica de atributos

### Tipos de Hierarquias

**Simples ou Estritas** cada um dos nós ou níveis apenas tem um nó ascendente (pai) e um nó descendente (filho);

**Não Estritas** cada nível na árvore da hierarquia tem apenas um possível nível pai, tendo o mesmo critério de análise; cada instância pode, contudo, ter mais do que uma instância no nível pai;

**Múltipla e de caminhos alternativos** cada nível da árvore da hierarquia pode ter mais do que uma instância no nível pai;

**De caminhos paralelos** cada nível da árvore poderá ter mais do que um nível pai e cada instância de um dado nível poderá pertencer a mais do que uma instancia no nível pai.

## Modelação Dimensional

A modelação dimensional de dados é uma das atividades mais relevantes que usualmente se desenvolve no âmbito de um projeto de conceção e implementação de um sistema de data warehousing. Permite a conceção das estruturas de dados de um data warehouse de acordo com as várias perspetivas de análise dos agentes de decisão do domínio em questão.

É a atividade relacionada com o desenvolvimento de esquemas para sistemas de dados, especialmente orientados para o suporte a processos de tomada de decisão.

São os alicerces de todos os processos de tomada de decisão suportados por um data warehouse.

Os SDW devem acolher e refletir as necessidades de suporte à decisão requeridas pelos agentes empresariais e serem capazes de satisfazer as suas queries e necessidades de reporting.

Devem também ser rápidos, apresentando excelentes desempenhos na satisfação desses requisitos, o que implica que as suas estruturas de dados devam estar orientadas especificamente para o fornecimento dos dados pedidos sem necessidade de queries complexas.

### Etapas da Modelação Dimensional

1. Construção da matriz de decisão;
2. Seleção do datamart a desenvolver;
3. Escolha do grão das tabelas de factos;
4. Escolha das dimensões;
5. Desenvolver diagrama das tabelas de factos;
6. Documentar as tabelas de factos;
7. Projetar o detalhe das dimensões;
8. Desenvolver os diversos factos derivados;
9. Completar o esquema lógico da base de dados;
10. Identificar os possíveis candidatos de agregados armazenados previamente;
11. Desenvolver a estratégia de desenvolvimento para as tabelas de agregados;

### Etapas da Análise de Fontes

1. Identificar as fontes de dados candidatas;
2. Analisar o conteúdo das fontes de dados – dados e metadados;
3. Desenvolver mapeamento de dados: source-to-target map;
4. Estimar número de registos futuros no processo de povoamento;

Uma tabela de factos, porque tem uma chave primária composta feita por 2 ou mais chaves estrangeiras, expressa sempre um relacionamento. As tabelas de factos mais úteis contêm também 1 ou mais factos numéricos e aditivos que definem cada registo.

As tabelas de dimensões, em contrapartida, contém geralmente informações textuais descritivas.

A chave para entender o relacionamento entre modelação dimensional e ER é que um simples diagrama ER pode transformar-se em múltiplos diagramas com tabelas de factos. Por isso, devemos pensar que um diagrama ER representa todos os possíveis processos de negócio numa empresa. O diagrama ER pode ter vendas, encomendas, envios, pagamentos, clientes... tudo no mesmo diagrama. Ou seja, representa múltiplos processos que nunca coexistem num único conjunto de dados num único ponto consistente no tempo. É muito mais complexo!

#### ER -> Modelo Dimensional

- Observe os relacionamentos 1:N existentes. Podem sugerir dimensões;
- Observe as entidades fortes. Podem sugerir dimensões;
- Observe entidades que expressam documentos como nota fiscal, pedido, ordem de compra, etc... podem sugerir factos;
- Observe relacionamentos N-N. Nas tabelas associativas pode haver valores númericos. Sugere factos;
- Observe os atributos que estarão nas tabelas de dimensões. Analise a relação de hierarquias entre esses atributos de dimensão. Atente para os relacionamentos N-N entre eles. Pode definir granularidade.

### As forças da modelação dimensional

O modelo dimensional tem várias vantagens importantes no armazenamento de dados que o modelo ER não possui.

- O modelo dimensional é uma estrutura padrão previsível. Ferramentas de consulta e interfaces de utilizador podem todos usá-lo de forma a obterem resultados mais fáceis de serem percebidos e o processo é também mais eficiente;
- A estrutura previsível do esquema star join resiste a mudanças inesperadas nos comportamentos dos utilizadores. Cada dimensão é equivalente e todas podem ser vistas como pontos de entrada simetricamente iguais na tabela de factos. O design lógico pode ser feito independentemente dos padrões de queries esperados;
- É extensível para acomodar novos elementos de dados inesperados e novas decisões de design. Ou seja, todas as tabelas existentes podem ser alteradas no local simplesmente adicionando novas linhas de dados ou executando SQL ALTER TABLE e os dados não devem ser recarregados. A extensibilidade também significa que nenhuma ferramenta de consulta (queries) precisa de ser reprogramada para acomodar a alteração. Além disso, todos os aplicativos antigos continuam a serem executados sem produzirem resultados diferentes. Modelos dimensionais podem ser alterados normalmente;
- Existem várias abordagens padrão para lidar com situações comuns de modelagem no mundo dos negócios. Cada uma dessas situações tem um conjunto bem compreendido de alternativas que podem ser especificamente programadas em ferramentas de consulta e interfaces de utilizador. Essas situações incluem:

1. Dimensões de alteração lenta – em que uma dimensão constante como Produto ou Cliente evolui de forma lenta e assíncrona. A modelagem dimensional fornece técnicas específicas para lidar com dimensões que mudam lentamente, dependendo do ambiente de negócios;
2. Produtos heterogéneos – onde um negócio como um banco precisa de acompanhar várias linhas de negócio diferentes num único conjunto comum de atributos e factos, mas, ao mesmo tempo, precisa de descrever e medir as linhas individuais de negócios de forma altamente independentes ou idiossincráticas, usando factos incompatíveis;
3. Bases de Dados com pagamento antecipado, em que as transações não são pequenas receitas, mas a empresa precisa de analisar as transações individuais e olhar para os relatórios de receitas regularmente;
4. Bases de Dados de manipulação de eventos, em que a tabela de factos geralmente não tem factos;

- Uma força final do modelo dimensional é o crescente corpo de utilitários administrativos e processos de software que geram e usam agregados. Agregados são registos sumário que são logicamente redundantes com dados de base que já estão no data warehouse, mas são usados para melhorar muito o desempenho de consulta. Se não tiver agregados, estará potencialmente a desperdiçar milhões de euros em atualizações de hardware para resolver problemas de desempenho que poderiam ser resolvidos de outros forma pelos agregados;

A tarefa de planear um data warehouse é assustadora. O gerente recém-nomeado para datewarehousing  numa grande empresa enfrenta dois desafios enormes e aparentemente não relacionados. Por um lado, o gerente deve entender o conteúdo e a localização do ativo mais complicado pertencente à empresa: os dados. De alguma forma (geralmente durante a noite), o novo gerenciador de data warehouse deve se tornar uma autoridade sobre exatamente o que está contido em todas as tabelas e cada campo em cada tabela deve ser entendido. O gerente do data warehouse deve ser capaz de recuperar qualquer elemento de dados e, se necessário, deve poder limpá-lo e corrigi-lo. Por outro lado, o gerente do datawarehouse deve entender exatamente o que mantém a gerência acordada à noite. Espera-se que o datawarehouse contenha exatamente os dados necessários para responder às questões candentes. É claro que o gerente do datawarehouse está livre para participar da alta administração a qualquer momento para discutir as prioridades corporativas atuais.

| Modelo ER/Relacional                                                           | Modelo Dimensional                                                  |
|--------------------------------------------------------------------------------|---------------------------------------------------------------------|
| Mais complexo                                                                  | Estrutura mais fácil e intuitiva                                    |
| Anos 70 - BD relacional                                                        | Anterior ao ER, recriada por Kimball                                |
| Tabelas representam conjuntos de entidades e relacionamentos                   | Tabelas representam factos e dimensões                              |
| Tabelas resultantes normalizadas (até à 3ªFN)                                  | Tabelas de facto normalizadas. Dimensões podem não ser              |
| Tabelas acedidas indistintamente de filtro inicial                             | Tabelas de dimensão são pontos de entrada para acesso               |
| Maior necessidade e dificuldade de junção                                      | Junções só ocorrem entre tabelas de facto e dimensões               |
| Maior dificuldade de leitura e de consulta por utilizadores não especializados | Leitura e consulta mais fáceis para utilizadores não especializados |

A pressão desta tarefa assustadora acumulou-se até o ponto em que o seu relevo tem um nome. O nome é **data mart**.

O termo **data mart** significa evitar a impossibilidade de lidar com o trabalho de planeamento de um data warehouse de uma só vez.

***

**Factos** Um modelo dimensional distingue factos de atributos. Um facto, geralmente, é algo que não é conhecido antecipadamente e é uma observação no mercado. Muitos factos no mundo são numéricos, embora alguns possam ser texto. O designer deve suspeitar que, qualquer campo de dados numérico (especialmente se for flutuante), é provavelmente um facto e não um atributo. Às vezes, um valor numérico como um preço padrão parece ser um atributo da dimensão do produto e parece ser uma constante que é conhecida antecipadamente. Mas, num exame mais detalhado, o atributo padrão de preço acaba por ser ajustado uma ou duas vezes por ano. Nesses casos, no final da fase de design, mudamos de ideias e tornamos o preço padrão como um facto medido. Tomamos, então, uma decisão típica (e correta) de transformar quase todos os campos de números flutuantes em factos.

**Atributos** São, em contraste, geralmente campos de texto e descrevem uma característica de uma coisa tangível ou palpável. Os atributos mais óbvios são as descrições de produtos. O sabor de um produto é um atributo bem conhecido do produto e provavelmente é exibido de maneira proeminente na embalagem do produto... não medimos o atributo de sabor de um produto, sabemos disso com antecedência. Se criarmos outro produto com um novo sabor, criamos um novo registo de produto.

**Dimensões** Os atributos textuais que descrevem as coisas são organizados dentro das dimensões. Num datawarehouse de um retail temos, no mínimo, dimensões produto, loja, cliente, promoção e tempo. Uma dimensão é uma coleção de atributos semelhantes a texto altamente correlacionados entre si. Existe um certo grau de julgamento do designer na escolha das dimensões. Aqui, poderíamos tentar combinar a dimensão do produto com a dimensão de loja e criar uma única dimensão de armazenamento de produto. Se tivéssemos 1000 produtos e 100 lojas, precisaríamos perguntar com quantas lojas de produtos acabamos quando tentamos combinar essas dimensões... Se não houvesse correlação significativa entre produto e loja, e cada produto fosse vendido em todas as lojas, então a nossa dimensão combinada de produto-loja seria o produto cartesiano das duas dimensões originais e teríamos 100.000 lojas de produtos. Embora essa nova dimensão combinada contivesse exatamente as mesmas informações que as dimensões originais, rejeitaríamos esse design imediatamente porque a nova dimensão maior seria difícil e apresentaria problemas de desempenho e sem vantagens na interface do utilizador.

Inversamente, se a dimensão combinada contivesse apenas 2000 lojas de produtos, isso indicaria que os produtos eram marcados para vender em lojas muito específicas. Neste caso, a dimensão combinada seria muito útil. Não só seria muito compacto, mas a dimensão em si revelaria informações muito interessantes sobre a relação entre produtos e lojas e seria um alvo de navegação desejável. Na maioria dos casos, o designer pode usar sua intuição sobre dimensões separadas para determinar se elas devem ser combinadas, mas em alguns casos as dimensões são abstratas e o designer pode ter que executar uma série de operações COUNT DISTINCT em combinações de atributos para ver se eles são realmente independentes ou não.

Há dados redundantes nas tabelas de dimensões (desnormalizadas).

### Flocos de Neve Admissíveis

Uma dimensão é dita como snowflaked quando os campos de baixa cardinalidade na dimensão foram removidos para tabelas separadas e vinculados novamente à tabela original com chaves artificiais. Geralmente, o snowflaking não é recomendado num ambiente de data warehouse. Snowflaking quase sempre torna a apresentação ao utilizador mais complexa. Os criadores de bases de dados geralmente gostam dessa complexidade, mas os utilizadores geralmente sentem-se intimidados pelos detalhes. Snowflaking também faz com que a maioria das formas de navegação entre os atributos dimensionais seja mais lenta. Lembre-se de que a maioria das navegações envolve a seleção de valores distintos de um atributo de dimensão sujeito a um ou mais outros atributos na dimensão que está sendo restringida. Obviamente, uma tabela de categoria snowflaked terá um desempenho extremamente bom se o utilizador estiver a solicitar apenas os valores distintos da categoria sem restrições auxiliares, mas se o utilizador estiver a limitar o tipo de pacote ao mesmo tempo, a consulta precisará entrar na tabela snowflaked (categoria) e voltar para a tabela de dimensões do produto e, possivelmente, sair através de outro link de floco de neve para a tabela do tipo de pacote onde a restrição foi colocada. Numa dimensão de produto realista com 250.000 registos, essa consulta pode demorar vários minutos numa BD relacional conhecida. E, no entanto, essa consulta simples deve ser uma ação da interface do utilizador que responde em um ou dois segundos.

Alguns designers de BDs fazem flocos de neve, porque eles estão a tentar economizar espaço no disco. Certamente, eliminando todos os campos de texto desagradáveis, economizaremos espaço. Garantido está que se a chave artificial necessária para cada entrada preenchida com flocos de neve for menor do que a sequência de texto que ela substitui (uma suposição razoável), algum espaço será salvo.

**O efeito floco-de-neve (a remoção de atributos de baixa cardinalidade de uma tabela de dimensões) quase sempre interfere na compreensão do utilizador e no desempenho da navegação de atributos cruzados.**

Apesar desta proibição contra snowflaking, ainda existem algumas situações em que pedimos que construas uma **subdimensão** que tenha a aparência de uma tabela com flocos de neve.

Em DataWarehousing encontramos designações como estrelas, flocos de neve, constelações, galáxias e outras mais... A grande maioria delas é utilizada para caracterizar a forma como as tabelas de factos e as dimensões de um esquema dimensional são organizadas. A configuração mais elementar e vulgar é a configuração em estrela (star schema).

### Importância de Atributos Detalhados de Alta Qualidade

Atributos de dimensão são os pontos de entrada no data warehouse. Atributos de dimensão são onde a maioria das restrições interessantes são colocadas. Os atributos de dimensão fornecem o conteúdo da maioria das respostas da interface do utilizador quando este pede para ver o que está disponível quando a navegar.

**Em muitos aspectos, a qualidade do data warehouse é medida pela qualidade dos atributos de dimensão.**

Uma tabela de dimensões ideal contém muitos campos de texto legíveis que descrevem os membros da dimensão específica. Esses campos de texto contém palavras individuais expandidas ou frases curtas, não códigos ou abreviações. Os projetistas de dados geralmente estão convencidos de que os utilizadores querem códigos de produção ou de que aceitarão esses códigos em vez de equivalentes em texto completo. Uma das principais responsabilidades da equipa de data warehouse é fornecer o texto completo para cada código e garantir a qualidade deste texto. É útil lembrar que as respostas da interface do utilizador e os relatórios finais geralmente estão restritos ao conteúdo preciso dos atributos da tabela de dimensões. Atributos de texto incompletos ou mal administrados levam diretamente a relatórios finais incompletos ou mal produzidos.

A equipa do data warehouse deve eliminar os atributos que se parecem com: C001AX247 ou GRN PAPR TOWLS 3OZ MULTIPCK RVS.

O objetivo da equipa do data warehouse deve ser criar atributos da tabela de dimensões que sejam descritivos, completos (sem valores ausentes), com qualidade garantida (sem erros ortográficos, valores impossíveis, valores obsoletos ou órfãos, ou versões cosmeticamente diferentes do mesmo atributo), indexados, igualmente disponíveis (numa dimensão simples e desnormalizada) e documentados (em metadados que explicam a origem e interpretação de cada atributo).

### Dimensão Tempo

A dimensão Tempo ocupa um lugar especial em cada data warehouse, porque praticamente toda a tabela de factos do data warehouse é uma série temporal de observações de algum tipo. Essa tabela nos permite comparar dias e semanas comparáveis em anos diferentes e permite-nos encontrar o final do mês e rotular nossas temporadas e períodos fiscais privados. Lembre-se de que o grande motivo para este cronograma detalhado é remover todos os vestígios de conhecimento de calendário de nossos aplicativos reais. Conduzimos a navegação de calendário através da tabela de dimensão de tempo, não através de lógica codificada.

### Dimensões de Alteração Lenta - Variação

A premissa principal é que a chave do produto de produção ou a chave do cliente de produção não muda, mas a descrição do produto ou do cliente é diferente. Em resposta a essas mudanças, o data warehouse possui três opções principais:

1. Reescrita simples dos valores afetados;
2. Criação de tabela de histórico;
3. Criação de novos atributos.

Essas três opções são chamadas de respostas Tipo 1, 2 e 3 para uma dimensão de alteração lenta. A resposta do Tipo 1 é usada sempre que o valor antigo do atributo não tiver significado ou deva ser descartado. Certamente, a correção de um erro se enquadra nessa categoria. A resposta do tipo 2 é a principal técnica para rastrear com precisão uma alteração num atributo dentro de uma dimensão.

**A resposta do Tipo 2 requer o uso de uma chave substituta, porque estamos assumindo que a chave do produto de produção ou a chave do cliente não foi autorizada a mudar.**

### Dimensões que Alteram Rapidamente - Variação

As dimensões que mudam rapidamente são dimensões nas quais os valores de atributo da dimensão mudam com frequência, fazendo com que a dimensão cresça rapidamente se tiveres projetado a dimensão para capturar as alterações como uma dimensão Tipo 2. O rápido crescimento dessa dimensão afetará a manutenção e o desempenho à medida que a dimensão cresce. Vamos dar uma olhada nas soluções para este desafio.

Sugestão: Criação de mini-dimensão (ex: DIM_CUSTOMER_ATTRIBUTE)

As mini-dimensões contêm os atributos que mudam rapidamente da dimensão original e são tratados como uma dimensão independente. Essa dimensão unirá os atributos em vez de tratá-los como dados individuais. A tabela de fatos pode, então, conectar-se à mini-dimensão com base nos dados fornecidos ou essa mini-dimensão pode ser conectada à dimensão "pai" usando a chave substituta.

### Dimensões Conforme (Conformed dimension)

Quando lidamos com mais do que uma área de decisão (vários datamarts), é possível que aconteça que mais do que uma tabela de factos incorpore uma mesma dimensão na sua estrutura. Ou seja, basicamente é uma dimensão que será partilhada pelas duas tabelas de facto.

### Dimensões Degeneradas

É uma dimensão que não possui qualquer atributo que a caracterize para além daquele que integra a chave da tabela de factos (ex: VendaID);

### Dimensões Gigantescas

A categorização de uma dimensão como sendo gigantesca é muito subjetiva.

### Mini-Dimensões

Por vezes, na caracterização de uma dimensão, integramos um número de atributos tal que a sua estrutura atinge uma **dimensão bastante significativa**.

Verifica-se que uma grande maioria dos atributos raramente intervêm nas queries lançadas pelos agentes de decisão e existe um dado conjunto de atributos cujos valores variam com alguma frequência ao longo do tempo.

Por isso, quebra-se uma dimensão em dimensões menores artificiais para controlar o crescimento explosivo de uma dimensão grande, com mudança rápida.

### Sub-Dimensão (Outrigger dimension)

São tabelas definidas especificamente para apoiarem a caracterização de uma dimensão principal (que está ligada a pelo menos 1 tabela de factos).

São tabelas criadas para reduzirem o nível de redundância existente na dimensão à qual estão ligadas. Ex: País, Localidade...

### Dimensão com Diferentes Papéis (Role-playing dimension)

Tabela de dimensão regular, mas que está referenciada mais do que uma vez numa mesma tabela de factos. Cada uma dessas referências dá sentido a um contexto de aplicação diferente. Ex: uso de diferentes datas da Dim-Calendário na tabela de factos...

### Dimensão de Controlo (Junk dimension)

Por vezes, é necessário reduzir o tamanho de uma tabela de factos porque:

- pode estar a provocar algum **tipo de estrangulamento** no desempenho do sistema na satisfação das queries;
- queremos **simplificar os processos de monitorização** e controlo desenvolvidos sobre as estruturas de dados implementadas;
- precisamos de **assegurar contextos transacionais** associados com uma dada tabela de factos;
- queremos obter um pouco mais de **comodidade** nos processos de manipulação de dados mantidos sobre o esquema dimensional em causa.

É uma dimensão abstrata especialmente concebida para acolher dados que não têm diretamente a ver com as atividades de análise. Exemplo: vendaID, pontovendaID...

### Chaves estrangeiras, chaves primárias e chaves substitutas

Todas as tabelas de dimensões possuem chaves únicas, que, por definição, são chaves primárias. Em outras palavras, a chave em si define exclusividade na tabela de dimensões.

#### Chaves de Substituição (Surrogate Keys)

**Motivos para uso:**

- a redução do espaço de armazenamento em disco;
- a diminuição do tempo de satisfação das queries;
- a heterogeneidade das fontes de informação já que as chaves naturais podem ter problemas de unicidade, ausência ou tamanhos exagerados;

São constituídas por "pequenos" inteiros, não relevam ou transmitem qualquer semântica acerca do negócio e têm um custo claramente inferior às chaves naturais. São transparentes para o utilizador final.

### Método 4 passos

O design lógico detalhado de um esquema dimensional é orientado por quatro etapas.
Uma das formas mais usuais de fazer o desenvolvimento de um esquema dimensional é através da utilização do **método dos 4 passos**, que pressupõe o desenvolvimento do SDW tipicamente de baixo para cima (bottom-up).

1. Seleção da área de suporte à decisão a implementar;
2. Definição do detalhe dos factos (o grão) do processo selecionado;
3. Seleção das dimensões de análise sobre as quais se pretende analisar os factos;
4. Definição das medidas a integrar na estrutura de cada facto;

#### Passo 1. Escolhendo o Data Mart: Data Marts de Fonte Única e de Múltiplas Fontes

Escolher o data mart, no caso mais simples, é o mesmo que escolher a origem dos dados. Os data marts típicos incluem pedidos de compra, remessas, retail, pagamentos ou comunicações com o cliente. Estes seriam exemplos de data marts de fonte única. Em casos mais complexos, podemos definir um datamart que deve incluir origens de vários sítios. O melhor exemplo de um data mart de fonte múltipla é a lucratividade do cliente, em que as fontes que descrevem a receita devem ser combinadas com fontes que descrevem os custos.

Ou seja, nesta etapa, analisamos os cabeçalhos das linhas da nossa matriz e escolhemos um dos data marts. A primeira tabela de factos no design deve vir de um único data mart de origem. A escolha do data mart e, portanto, a fonte de dados, ancora o nosso pensamento.

#### Passo 2. Declarando o Grão da Tabela de factos: Estilos de Tabelas de factos

Embora pareça um passo técnico detalhado, é crucial definir com muita clareza exatamente o que é um registo de tabela de factos no projeto dimensional proposto. Sem essa definição, o design não pode prosseguir e, sem uma definição clara, os arquitetos de dados desperdiçarão tempo valioso a argumentar sobre o que é uma dimensão e o que é um facto. Chamamos este passo: declarar o grão.

**Seja muito preciso ao definir o grão da tabela de factos. Não deixe este passo para fora. O grão é a resposta para a pergunta: O que é um registo de facto, exatamente?**

Geralmente, o grão da tabela de factos é escolhido para ser tão baixo ou granular quanto possível. Quanto menor o nível de granularidade, mais robusto é o design. Vimos que um nível muito baixo de granularidade é muito melhor em responder a novas consultas inesperadas e muito melhor em responder à introdução de novos elementos de dados adicionais do que níveis mais altos de granularidade.

Opções típicas para o grão da tabela de factos podem ser expressas da seguinte forma:

- Cada transação de vendas é um registo de factos;
- Cada transação de sinistros é um registo de factos;
- Cada transação de caixa multibanco é um registo de factos;
- O total diário de vendas de produtos em cada loja é um registo de factos;
- Cada snapshot mensal de uma conta é um registo de factos;
- Cada produto de uma encomenda é um registo de factos;
- Cada cobertura em cada apólice de seguro individual é um registo de factos.

Embora todas essas opções pareçam semelhantes, a lista anterior representa três estilos comuns de tabelas de factos.

Há 3 formas de caracterizar o tipo de uma tabela de factos:

- Transacional;
- Instantâneo;
- Acumulativo.

As três primeiras opções de grãos são transações individuais. Num determinado dia ou mês, podemos medir qualquer número de transações para um determinado produto ou sobre uma determinada conta. O número pode ser zero ou um milhão. Não temos garantia de encontrar uma transação sobre um produto ou sobre uma conta na BD. As transações individuais normalmente têm uma estrutura muito simples, como um campo de valor único com o valor da transação. Representam um evento que ocorreu num ponto instantâneo do tempo.

Os próximos dois exemplos de grãos na lista são instantâneos. Esperamos até o final do dia ou no final do mês, e tiramos um instantâneo da atividade que ocorreu durante esse período. Este instantâneo é mais complexo do que a perspectiva de transação individual. Podemos ter muitas medidas da atividade durante o período, incluindo vendas totais, número total de transações e factos semiaditivos, como o saldo final da conta. Em alguns casos, como as vendas no retail, pode ser fácil passar da perspectiva de transação individual para um instantâneo diário, porque podemos resumir as transações para o nível diário. São necessários para observar o desempenho cumulativo do negócio em intervalos de tempo regulares e previsíveis. Diferentemente do fato de transação, onde se carrega uma linha para cada ocorrência de evento, com o instantâneo periódico, tira-se uma fotografia da atividade no fim de um dia, uma semana ou um mês, e repetidamente ao fim de cada período.

Os dois exemplos finais são os acumulativos. Representam um tempo indeterminado, que cobre o ciclo de vida da transação ou do produto ou pessoa. Quase sempre possuem múltiplas datas, representando os múltiplos eventos ou fases que ocorrem durante o curso de um ciclo de vida.

Ou seja, em relação a este passo, o design dimensional de uma tabela de factos não poderia acontecer a menos que o grão dessa tabela de factos fosse declarado pela equipa de projeto no início. Declarar o grão equivale a dizer o que é um registo de tabela de factos individual. Se um registo de tabela de factos individual representar o total de vendas de itens diários em uma loja de retail, esse será o valor. Se o registo individual da tabela de factos for uma transação do cliente numa ATM, esse será o valor. Todas as decisões tomadas nos passos 3 e 4 (próximos passos) dependem da visualização correta do grão.

**Factos Aditivos** São numéricos e podem ser somados em relação às dimensões existentes. Ex: quantidade, valor na tabela itens...

**Factos Semi-Aditivos** São numéricos mas não podem ser somados em relação a todas as dimensões existentes. Ex: quantidade em stock pode ser somada ao longo da dimensão produto e loja. Ao longo de data/calendário não faz sentido.

**Factos Não-Aditivos** Informações/Factos textuais e alguns atributos numéricos que podem não ser somados. Ex: preço unitário, taxas e percentagens.

**Uma tabela de factos é normalizada**

**A maioria dos argumentos e mal-entendidos no projeto de BDs dimensionais resulta da falta de atenção suficiente à declaração de grãos.**

Tendo feito um requisito de alto contraste para declarar cuidadosamente o grão, é razoável que a equipa de design mude de ideias sobre o grão de uma determinada tabela de factos em algum ponto do projeto. Por exemplo, se o grão tiver sido declarado como o nível de stock diário de itens de stock individuais num centro de distribuição, a equipa de design poderá decidir que seria possível rastrear os números de lote acumulados em itens de stock porque foram descobertos que os sistemas de BDs estavam a registar corretamente os números de lote. Adicionar os detalhes extras dos números de lote pode ter um efeito significativo na escolha de dimensões e factos nas Etapas 3 e 4. O único ponto da história é que, a qualquer momento, a equipa de projeto deve visualizar com muita clareza o grão declarado.

**Grão de uma Tabela de Factos**

A definição do detalhe da informação que queremos manter nas nossas estruturas de dados do datawarehouse – o grão.

O grão de uma tabela de factos define a estrutura base, mais refinada, dos seus registos

- Não existe mais detalhe para além do grão;
- O grão só pode ser agregado;
- Não há maneira de desagregar o grão;
- O grão é aquele que define o nível de informação mais atómico.

#### Passo 3. Escolhendo as Dimensões

Assim que o grão da tabela de factos esteja firmemente estabelecido, a escolha das dimensões é bastante direta. O próprio grão geralmente determinará um conjunto primário ou mínimo de dimensões. Por exemplo, o conjunto mínimo de dimensões da encomenda de um produto teria que incluir a data do pedido, o cliente, o produto e uma dimensão especial degenerada, consistindo apenas no número do pedido. Dentro dessa estrutura, o projetista pode adicionar um número potencialmente grande de dimensões adicionais. Em quase todos os casos, essas dimensões adicionais assumem um valor único no contexto das dimensões primárias. Assim, dimensões adicionais, como data de entrega, termos do contrato, status do pedido e modo de entrega, podem ser adicionadas a critério do designer, se os dados de origem estiverem disponíveis. Em muitos desses casos, uma dimensão pode ser adicionada normalmente ao design porque a adição não altera o tamanho da tabela de factos. Um exemplo de uma dimensão graciosamente adicionada pode ser uma dimensão causal que é adicionada ao design para explicar factos exógenos do mercado, como promoções, ações de concorrentes ou o clima.

A tabela de factos num modelo dimensional é um conjunto de medições simultâneas numa granularidade específica. As medições mais úteis são numéricas, mas não precisam ser numéricas.

O valor único das dimensões escolhidas tem algumas implicações. Se as nossas medições estão verdadeiramente num grão diário, a dimensão de tempo associada também deve ser num grão diário. Podemos alternativamente anexar o ano às medidas como uma dimensão, mas isso é bastante monótono.

Cada dimensão tem sua própria granularidade. A granularidade de uma dimensão individual não pode ser menor que a granularidade geral da tabela de factos. Em outras palavras, se a granularidade da tabela de factos especificar uma hora mensal, a dimensão de tempo não poderá ser dias ou semanas. Curiosamente, a granularidade de uma dimensão individual pode ser mais grosseira do que a granularidade da tabela de factos sem causar uma contradição lógica. Por exemplo, a dimensão do modo de entrega pode ser limitada a ar e terreno, embora os dados subjacentes contenham muito mais detalhes. A dimensão do produto pode até ser declarada em um nível mais alto do que a unidade individual de manutenção de stock (SKU), como a marca. Em ambos os casos, parece que houve uma perda de informações úteis para os utilizadores finais, mas o design por si só não introduziu quaisquer contradições lógicas.

Ou seja, neste passo, uma boa declaração clara do grão geralmente facilita a escolha das dimensões para a tabela de factos específica. Frequentemente, o grão é declarado em termos de dimensões primárias. Níveis diários de stock de itens de stock individuais num centro de distribuição especifica claramente a dimensão de tempo, a dimensão de item de stock e talvez a dimensão de local. Outras dimensões podem ser rapidamente testadas contra o grão para ver se fazem sentido.

**Se uma dimensão não corresponder ao grão, a equipa de design tem duas opções principais: eliminar a dimensão ou alterar a declaração de grão.**

No exemplo de faturação do cliente da companhia telefónica, podemos escolher o grão como o item de linha individual em cada fatura mensal do cliente. Esse gráfico especifica claramente uma dimensão de tempo, uma dimensão de cliente, uma dimensão de serviço (item de linha) e talvez uma dimensão de taxa ou promoção.

A equipa de design deve ser bastante criativa nesta etapa. Todas as dimensões do portfólio mestre de possíveis dimensões devem ser testadas contra o grão para ver se elas se encaixam. Qualquer dimensão que assuma um único valor na presença do grão é um candidato viável. Por exemplo, uma BD de retail pode ter as dimensões óbvias de tempo, produto e loja, mas a equipa de design pode decidir que uma dimensão de clima seja adicionada aos dados. Isso ajuda, é claro, para a equipa de design ter uma fonte de dados climáticos em mente.

Observe que o mês de cobrança não é o mesmo que o mês de calendário e as tabelas de factos separadas que usam essas duas interpretações de tempo devem rotulá-las como dimensões distintas. Esta é uma das lições das dimensões conformadas. Quando as coisas são as mesmas, elas devem ser exatamente iguais e ter os mesmos nomes. Quando as coisas são diferentes, elas devem ter nomes diferentes.

Depois que uma dimensão é escolhida, pode haver um grande número de atributos descritivos, que podem ser usados ​​para preencher a dimensão. Esses atributos descritivos podem vir de várias fontes. Nesse ponto do processo de quatro etapas, é útil fazer uma lista linear longa de todos os atributos descritivos conhecidos disponíveis para descrever um item na dimensão (um produto, um serviço, um cliente, um local ou um dia). O objetivo neste estágio do projeto é ser abrangente e detalhado. Os detalhes de fornecimento de dados e qualidade dos dados serão resolvidos durante o projeto detalhado da fase de implementação.

#### Passo 4. Escolhendo os factos

O grão da tabela de factos também permite que os factos individuais sejam escolhidos e deixa claro qual deve ser o alcance desses factos. No caso de tabelas de factos de transações individuais, já indicamos que geralmente há apenas um facto, ou seja, o valor da transação. Tabelas de factos de instantâneo têm o número mais aberto de factos porque qualquer resumo de atividade durante o período de instantâneo é algo bom para a tabela de factos. Tabelas de factos de instantâneos podem ser estendidas com factos adicionais quando sumários úteis adicionais são identificados. As tabelas de factos de acumulativos também podem conter vários factos, pois, por exemplo, um item de linha individual pode ser dividido em quantidades, valores brutos, ajustes, descontos, valores líquidos e impostos.

**Os factos devem sempre ser específicos para o grão da tabela de factos.**

Em outras palavras, não misture factos de outros períodos de tempo ou outras agregações para tornar os cálculos convenientes. Quaisquer factos que não correspondam ao exato grau do registo da tabela de factos causarão estragos quando uma ferramenta de consulta ou ferramenta de relatório tentar combinar esses factos em várias dimensões. Não há problema em criar registos agregados ou resumidos para desempenho e outros motivos, mas esses factos são sempre armazenados em registos diferentes em tabelas de factos diferentes.

Ou seja, neste último passo é adicionar tantos factos quanto possível dentro do contexto do grão declarado. Contudo é muito importante resistir ao impulso de acrescentar factos do grão errado.

### Tipo de uma Tabela de Factos

O tipo de uma tabela de factos revela-nos:

- A forma como é povoada;
- O tipo de elementos de dados que irá acolher;
- A forma como os seus dados serão extraídos das fontes de informação;
- A cadência do seu povoamento;
- A periodicidade de refrescamento.

### Dimensões N-N

É uma situação que ocorre quando vários registos de uma mesma dimensão estão relacionados ao mesmo tempo com um ou mais registos da própria tabela de factos;

Por exemplo, se a fatura de um paciente for a tabela de factos e diagnóstico for uma dimensão, é possível que haja mais do que um diagnóstico. **Solução: Inserção de tabelas ponte!**

Cada paciente passa a ter um grupo de diagnósticos com chave. A chave do grupo mais a do diagnóstico individual constituem a chave da tabela de ponte.

### Tabelas de Factos sem Factos (Factless)

Existem duas situações de modelagem nas quais o designer entra no processo de design normal, mas não consegue encontrar nenhum facto para entrar na tabela de factos. Essas tabelas de factos sem factos são muito úteis para descrever eventos e cobertura, para que possamos perguntar o que não aconteceu.

O primeiro tipo de tabela de factos sem factos é uma tabela que regista um evento.

Exemplo: Estamos a acompanhar a frequência dos estudantes numa faculdade. Imagine que temos um sistema moderno de rastreamento de alunos que detecta o evento de comparecimento de cada aluno todos os dias. Dimensões plausíveis incluem:

- **Data** Um registo nesta dimensão para cada dia no calendário.
- **Estudante** Um registo nesta dimensão para cada aluno.
- **UC** Um registo nesta dimensão para cada UC ministrado a cada semestre.
- **Professor** Um registo nesta dimensão para cada professor.
- **Sala** Um registo nesta dimensão para cada sala, laboratório ou campo de atletismo.

O grão da tabela de factos é o evento de participação individual do aluno. Quando o aluno entra pela porta da palestra, um registo é gerado. É claro que essas dimensões são todas bem definidas e que o registo de tabela de factos, consistindo de apenas as cinco chaves, é uma boa representação do evento de frequência estudantil.

O único problema é que não há nenhum facto óbvio para registar cada vez que o aluno participa de uma palestra ou se prepara para a educação física. Coisas como a nota do curso não pertencem a essa tabela de factos. Nossa tabela de factos representa o processo de frequência do aluno, não o processo de classificação semestral ou até mesmo o processo de exame intermediário. Ficamos com a sensação estranha de que algo está a faltar.

Na verdade, essa tabela de factos que consiste apenas em chaves é uma tabela de factos perfeitamente boa e provavelmente deveria ser deixada como está. Muitas perguntas interessantes podem ser feitas sobre este esquema dimensional, incluindo:

- Que aulas foram as mais fortemente frequentadas?
- Que aulas foram mais consistentemente frequentadas?
- Quais professores ensinaram mais alunos?
- Quais professores deram aulas em instalações pertencentes a outros departamentos?
- Quais instalações foram as menos usadas?
- Qual foi a distância total média de caminhada de um aluno num determinado dia?

Um segundo tipo de tabela de factos sem factos é chamado de tabela de cobertura. Tabelas de cobertura são frequentemente necessárias quando uma tabela de factos primários em um data warehouse dimensional é esparsa. Por exemplo, certa tabela de factos de vendas responde a muitas perguntas interessantes, mas não pode responder a perguntas sobre coisas que não aconteceram, como quais produtos estavam em promoção, mas não foram vendidos.

**As tabelas de factos são o método preferencial para registar eventos num data warehouse onde não há nenhuma medida numérica natural associada ao evento. Tabelas de factos sem factos também são usadas para garantir cobertura.**

Ou seja, para:

- realizar intensivamente operações de contagem sobre um ou mais atributos de dimensão contidos na TF;
- suportar a definição de relacionamentos N-N;
- manter log de eventos;

### Dicas/Boas Práticas Detalhadas de Design

Nesta secção, listamos várias dicas de design diversas que foram úteis ao trabalhar com uma equipa de designers para avançar nas quatro etapas:

- Um atributo pode viver numa e apenas numa dimensão, enquanto um facto pode ser repetido em várias tabelas de factos;
- Se uma única dimensão, como entidade comercial, parece residir em mais de um local, várias funções provavelmente estão sendo reproduzidas. Nomeie os papéis de forma exclusiva e trate-os como dimensões separadas;
- Um único campo nos dados de origem subjacentes pode ter uma ou mais colunas lógicas associadas a ele. Por exemplo, o campo de atributo do produto pode ser convertido em código do produto, descrição resumida do produto e descrição longa do produto;
- Todos os factos devem ter uma regra de agregação padrão (soma, min, max, mais recente, semiaditivo, algoritmo especial e não agregável);
- Garantir que qualquer tabela de factos tenha associada uma tabela de dimensão tempo;
- Garantir que todos os factos numa tabela de factos respeitam o grão definido, no mesmo nível de detalhe;
- Eliminar relacionamentos N-N em tabelas de factos;
- Eliminar relacionamentos 1-N em dimensões;
- Ter a certeza que as tabelas de dimensão utilizam uma chave de substituição (surrogate key);
- Criação de dimensões partilhadas (conformed dimensions) de forma a permitir a integração de dados em todos os domínios empresariais.

## Data Staging e ETL

A camada de data staging usa processos de ETL para extrair, integrar e limpar os dados que vêm das fontes operacionais de modo a alimentar a camada de datawarehouse. Numa arquitetura de 3 camadas, os processos de ETL, na verdade, alimentam a camada de reconciliação e, depois, o ETL trabalha quando o datawarehouse é povoado pela primeira vez e sempre que é atualizado.

### Extração

Os dados relevantes são extraídos das fontes. Podemos usar extração estática quando o datawarehouse precisa de ser povoado pela primeira vez e extração incremental para atualizar o datawarehouse regularmente. A incremental é, algumas vezes, baseada num log mantido na fonte (timestamp), baseada em notificações de alterações desde a fonte ou em triggers da fonte quando há transações em dados relevantes.

**Como regra geral, cerca de 60% das horas de desenvolvimento do armazém são gastos no processo de extração.**

### Limpeza

- **Dados duplicados** por exemplo, um paciente é guardado muitas vezes num sistema de gestão de pacientes de um hospital;
- **Valores inconsistentes** que são logicamente associados – por exemplo, moradas e códigos de postal;
- **Dados em falta** por exemplo, o emprego de um cliente;
- **Dados impossíveis ou inválidos** por exemplo, 2/30/2009
- **Valores inconsistentes de más práticas** por exemplo, Famalicão e Vila Nova de Famalicão ou simplesmente erros de escrita;

### Transformação

É o core desta fase. Converte dados das fontes em dados no formato do datawarehouse destino. Numa arquitetura de 3 camadas, esta fase consiste no output da camada de reconciliação. Independentemente da presença de uma camada desse tipo, é sempre preciso um mapeamento source-to-target.

- **Integração** A integração envolve a geração de chaves substitutas, o mapeamento de chaves de um sistema para outro e o mapeamento de códigos em descrições completas. Há também uma responsabilidade implícita de manter uma tabela de pesquisa de chave mestra por trás dessa transformação.
Chaves substitutas são geralmente atribuídas como números inteiros, aumentando em um para cada nova chave.
- **Dimensões de Alteração Lenta**;
- **Conversão do Tipo de Dados** envolve transformações de nível inferior convertendo um tipo ou formato de dados noutro;
- **Cálculo/Derivação/Alocação** aplicaçõ de regras de negócio identificadas durante o processo de requisitos (ex: juntar primeiro nome com último, capitalizar string, etc);

### Carregamento

Última fase. Pode ser feito de duas formas:

- **Refresh/Diferencial** o datawarehouse é completamente reescrito. Significa que os dados antigos são substituídos.
- **Update/Incremental** só as alterações feitas na fonte são adicionadas ao datawarehouse.

Tratamento de erros: Deves planear erros irrecuperáveis durante o carregamento, porque eles ocorrerão. O seu sistema deve antecipar isso e fornecer recuperação de falhas, parar e reiniciar o recurso. Primeiro, procure ferramentas e projete suas extrações para minimizar o impacto de uma falha. Por exemplo, um processo de carregamento deve confirmar conjuntos relativamente pequenos de registos de cada vez e acompanhar o que foi confirmado. O tamanho do conjunto deve ser ajustável, uma vez que o tamanho da transação tem implicações de desempenho em diferentes SGBDs. **TABELAS DE QUARENTENA**