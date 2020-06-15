

###carrega interface e defibe corres e abas

ui <- dashboardPage(skin = "purple",
  
    ###titulo do aplicativo exibido na lateral superior esquerda
    dashboardHeader(title = 'SAP-dp'
                  
  )
  ,

####abas exibidas na lateral esquerda  
  
  dashboardSidebar(sidebarMenu(
    
    menuItem("Home", tabName = "Home", icon = icon("home", lib = "glyphicon")),
    menuItem("Alinhamento", tabName = "alinhamento",icon = icon("align-center", lib = "glyphicon")),
    menuItem("Variantes", tabName = "variantes",icon = icon("search", lib = "glyphicon")),
    menuItem("Anotação", tabName = "anotacao",icon = icon("pencil", lib = "glyphicon"))
    )),


####como as abas serão exibidas para o usuario
  
  dashboardBody(tabItems(
    
######################################################################################################################
    
#aba principal: explicação de como usar, modelo de importação, etc
    tabItem(tabName = "Home", tags$h3(p(tags$strong("Seja Bem-Vindo ao SAP-dp!"))), h5(p("O aplicativo SAP-dp foi desenvolvido pelo Laboratório de Genômica da Universidade Federal de Santa Catariana, localizado em Florianópolis, Santa Catarina – Brasil. O principal objetivo é fornecer uma ferramenta simples e intuitiva para colaborar com pesquisas que buscam por variantes dentro de um genoma.  O SAP-dp tem sua primeira versão publicada operando com o genoma humano (hg19), mas, testes estão sendo realizados em diferentes espécies para apuração de sua eficácia para além do uso em genoma humano.
Para que a análise tenha sua eficácia total recomendamos fortemente que seja feita a leitura das instruções abaixo!")),

tags$h4(p(tags$strong("Manual de Instruções"))),	tags$h5(tags$strong(tags$a(href="www.rstudio.com", "(Download em PDF)"))),

h5(p("Todo o procedimento de busca de variantes deve ser realizado localmente visto que tamanho e o tempo de processamento das analises são grandes. Para isso o desenvolvemos um pacote em R (SAP-dp) que deve ser baixado no seu Rstudio para realização das análises.")),
h5(p(tags$strong("1 - Baixando o SAP-dp"))),
h5(p("Nesta etapa os arquivos, funções e scripts necessários serão baixados no seu computador.
Nota: esse procedimento deve ser realizado apenas um vez, após você pode iniciar do passo seguinte")),
h5(p(tags$em(" > install.packages(“SAP-dp”)"))),
h5(p(tags$strong('2- Carregando o pacote.'))),
h5(p(tags$em('> library(SAP-dp)'))),
h5(p(tags$strong('3 – Instalando e/ou carregando as dependências necessárias:'))),
h5(p(tags$em('> install.dep.SAP()'))),
h5(p(tags$em('> library.dep.SAP()'))),
h5(p(tags$strong('4 – Rodando o aplicativo:'))),
h5(p(tags$em('>runSAPdp()')))),


######################################################################################################################

#aba para fazer o alinhamento ao genoma de referencia
tabItem(tabName = "alinhamento", tags$h3(p(tags$strong("Alinhamento ao genoma de referência"))), tags$hr(), 
        h5(p("Nesta seção você irá realizar o alinhamento do seu exoma com o genoma de referência. Caso você já tenho efetuado esta parte você pode ir direto para etapa de Variantes. Para iniciar o alinhamento faça a identificação dos diretórios onde os arquivos estão localizados e aperte o botão Iniciar Alinhamento.  Assim que o alinhamento estiver pronto você receberá na tela uma mensagem de Sucesso.")),
        br(p('Informe o diretório do genoma de referência e o nome do arquivo:'), p(fileInput('idgenoma', "Escolher", multiple = FALSE, accept = NULL, buttonLabel = "Browse...",  placeholder = "No file selected")), verbatimTextOutput("dir1"), 
           br(actionButton("initAlin", "Iniciar o alinhamento")))
),


######################################################################################################################

#rodar a analise de variantes
      tabItem(tabName = "variantes", tags$h3(p(tags$strong("Identificação de Variantes"))),tags$hr(), h5(p("Nesta seção você irá realizar identificação de variantes do seu exoma baseado no seu genoma de referência.")),
            br(textInput('idamostra', 'Informe o diretório do genoma de referência e o nome do arquivo:', value="", width = NULL, placeholder = NULL),p("Ex: C:/Users/Área de Trabalho/sample.fasta"), verbatimTextOutput("dir2"),
              br(actionButton("initVaria", "Iniciar identificação de Variantes")))
            ),

######################################################################################################################

    #anotação dos variantes
       tabItem(tabName = "anotacao", tags$h3(p(tags$strong("Anotação dos genes"))), tags$hr(), h5(p("Nesta seção você irá realizar a anotação de variantes do seu exoma.")),
            br(textInput('idannot', 'Informe o diretório do arquivo gerado após a identifiação dos varientes e o arquivo gerado:', value="", width = NULL, placeholder = NULL), p("Ex: C:/Users/Área de Trabalho/sample.fasta"), verbatimTextOutput("dir3"),
              br(actionButton("initAnnot", "Iniciar anotação de Variantes")))
       )
######################################################################################################################

))

)