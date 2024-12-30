library(DiagrammeR)

grViz("
digraph CLD {
  
  # Node Definitions
  node [shape = ellipse, style = filled, color = lightblue]
  ProstateVolume [label = 'Prostate Volume']
  PSA [label = 'PSA Level']
  PI_RADS [label = 'PI-RADS Score']
  LesionChar [label = 'Lesion Characteristics']
  CancerLikelihood [label = 'Likelihood of Clinically Significant Prostate Cancer']
  MRI [label = 'MRI Technique']
  PSA_Accuracy [label = 'Accuracy of PSA as Cancer Indicator']

  # Edge Definitions (Relationships)
  edge [color = black]
  ProstateVolume -> PSA [label = '+', color = green]
  PSA -> CancerLikelihood [label = '+', color = green]
  LesionChar -> PI_RADS [label = '+', color = green]
  PI_RADS -> CancerLikelihood [label = '+', color = green]
  CancerLikelihood -> PSA [label = '+', color = green, style = dashed]
  MRI -> LesionChar [label = '+', color = green]
  ProstateVolume -> PSA_Accuracy [label = '-', color = red]
  PSA_Accuracy -> CancerLikelihood [label = '-', color = red]

  # Feedback Loops
  subgraph cluster_R1 {
    label = 'Reinforcing Loop R1: Diagnostic Escalation';
    color = lightgray;
    PSA -> CancerLikelihood;
    CancerLikelihood -> PSA;
  }

  subgraph cluster_B1 {
    label = 'Balancing Loop B1: Prostate Volume and PSA Specificity';
    color = lightgray;
    ProstateVolume -> PSA -> PSA_Accuracy -> CancerLikelihood;
  }
}
")
