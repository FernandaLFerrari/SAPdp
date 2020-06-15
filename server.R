
####Carrega os outputs e funções que vão rodar com as interações do usuario

server <- function(input, output) {
  
  
####define o local onde o comando de alinhamento ira pegar o arquivo 
    
  inFile <- reactive(input$idgenoma)
  output$dir_1 <- renderPrint(inFile())
    
    
####define o local onde o comando de variantes ira pegar o arquivo 
    
    output$dir2 <- reactive(input$idamostra)
    dir_2 <- reactive(output$dir2)
    
    
####define o local onde o comando de anotação de variantes ira pegar o arquivo 
    
    output$dir3 <- reactive(input$idannot)
    dir_3 <- reactive(output$dir3)

######################################################################################################################    
  
##roda o comando de alinhamento assim que o botão iniciar alinhamento for clicado
    
  observeEvent(input$initAlin, {
    
    
    com_ali <- "fastq2bam_hg19.sh" 
    reactive(system2(command = com_ali, args =  inFile$datapat))
    
    
  })

######################################################################################################################
  
    observeEvent(input$initVaria, {
      
      
      com_var <- "bam2vcf_mutec2_hg19.sh" 
      reactive(system2(command = com_var, args =  output$dir2))
      
      
    })

    
######################################################################################################################

    observeEvent(input$initVaria, {
      
      
      com_annot <- "vcf2annot_hg19.sh" 
      reactive(system2(command = com_annot, args =  output$dir3))
      
      
    })
    
######################################################################################################################
    
    
    
  }
  
 




