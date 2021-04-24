#Unit Conversion Calculator Demo

ui<-pageWithSidebar(
  # Application title
  headerPanel("Unit Conversion Calculator"),
  sidebarPanel(
    numericInput('Weight', 'Bodyweight (lbs)', value = 100),
    numericInput('Height', 'Height (ft)', value = 6),
    numericInput('Length', 'Length (in)', value = 1),
    numericInput('Temperature', 'Temperature (F)', value = 86),
    numericInput('Volume', 'Volume (Gallon)', value = 1),
    submitButton('Submit')
  ),
  mainPanel(
    h3('Converted Units'),
    h4('Weight (kg)'),
    verbatimTextOutput("OutWeight"),
    h4('Height (cm)'),
    verbatimTextOutput("OutHeight"),
    h4('Length (cm)'),
    verbatimTextOutput("OutLength"),
    h4('Temperature (Celsius)'),
    verbatimTextOutput("OutTemp"),
    h4('Volume (l)'),
    verbatimTextOutput("OutVolume"),
  )
)


server <- function (input,output) {
  output$OutWeight <- renderPrint({input$Weight/2.205})
  output$OutHeight <- renderPrint({input$Height*30.48})
  output$OutLength <- renderPrint({input$Length*2.54})
  output$OutTemp <- renderPrint({(input$Temperature-32)/9*5})
  output$OutVolume <- renderPrint({input$Volume*3.875})
}


shinyApp(ui = ui, server = server)