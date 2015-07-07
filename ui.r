



library(shiny)

# Define UI for slider demo application
shinyUI(fluidPage(
  
  
  #  Application title
  titlePanel("The economic value of environmental data:"),
#   fluidRow(  column(6,
#                     plotOutput("plot1"),
#                     plotOutput("plot2"))),

  # Sidebar with sliders that demonstrate various available
  # options
  sidebarLayout(
    sidebarPanel(
      fluidRow(column(9, 
        h5(strong("1000 simulations")))),
      # Simple integer interval
      sliderInput("rho", "rho:", 
                  min=0.1, max=10, value=0.4,  step= 0.1),#,
      
      sliderInput("lambda", "lambda:", 
                  min=0.1, max=2, value=0.15,  step= 0.01),
      #Decimal interval with step value
       sliderInput("sd_Disch", "sd Disch:", 
                   min = 0.2, max = 0.7, value = 0.4, step= 0.1),
      
      # Specification of range within an interval
      sliderInput("FM", "Fishing mortality:",
                   min = 0.02, max = 0.06, value = 0.04, step=0.005),
      sliderInput("Rev_CL", "Coverage level for insurance:", 
                  min=50, max=100, value=80,  step= 10),
      fluidRow(  column(12,
                                             plotOutput("plot1"),
                                             plotOutput("plot2")))
#       
#       # Provide a custom currency format for value display, 
#       # with basic animation
#       sliderInput("format", "Custom Format:", 
#                   min = 0, max = 10000, value = 0, step = 2500,
#                   format="$#,##0", locale="us", animate=TRUE),
#       
#       # Animation with custom interval (in ms) to control speed,
#       # plus looping
#       sliderInput("animation", "Looping Animation:", 1, 2000, 1,
#                   step = 10, animate=
#                     animationOptions(interval=300, loop=TRUE))



    ),


    # Show a table summarizing the values entered

    mainPanel(
    h1(" A notional insurance scheme for the European anchovy",align = "center"),
    fluidRow(
      column(4, wellPanel(
        h5("Parameters", em("rho"), "and", em("sd Disch"),"determines the survival of individuals affected by freshwater discharges from the Guadalquivir River."),
        h5("Parameter", em("lambda"),"determines the survival of individuals affected by the wind."),
        h5(em("F"), "represents the fishing mortality."),
        h5("Coverage level represents a proportion of the average revenue that insurance covers. So if CL is 80% insurance will make up the difference if revenue falls below 80% of the long term average revenue in the fixed F scenario.")
      )),
      #column(3,tableOutput("values")),
      column(3,wellPanel(h5(strong("HCR"), "is a harvest control rule that assumes the fishing mortality constant ignoring the effect of the environment in early survival while",strong("EHCR"),"is an environmentally-sensitive harvest control rule modifiying the fishing mortality according to the observed wind frequency"))),
      column(5,tableOutput("values2")),
     plotOutput("plot3")
    )#end fluidrow,
    ) #end mainpanel
    
  )
))
