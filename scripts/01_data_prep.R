library(tidyverse)

data <- readxl::read_excel("~/Downloads/enhanced_anxiety_dataset.xlsx")

anx_data <- data %>%
  select(`Occupation`, `Sleep Hours`, `Physical Activity (hrs/week)`,
         `Family History of Anxiety`,
         `Stress Level (1-10)`, `Anxiety Level (1-10)`,
         `Therapy Sessions (per month)`, Gender) %>%
  mutate(
    #Dependent variable: social anxiety level
    soc_anxiety = `Anxiety Level (1-10)`,
    
    #Main independent variables: sleep hours, physical activity, 
    #family history of anxiety, gender and stress level
    
    #Centered sleep hours
    sleep_hours_c = `Sleep Hours` - mean(`Sleep Hours`),
    
    phys_act = `Physical Activity (hrs/week)`,
    
    #Factorized family history
    has_fam_history = factor(`Family History of Anxiety`),
    
    gender = factor(Gender),
    
    #Scaled stress level to z-scores
    stress_level_z = scale(`Stress Level (1-10)`)[,1],
    
    #Control variables: occupation and monthly therapy sessions
    occupation = `Occupation`,
    
    t_sessions = `Therapy Sessions (per month)`
  )
