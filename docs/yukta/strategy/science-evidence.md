# Yukta: the evidence behind every lever

Manifesto rule 10: every recommendation is simple, proven and cited, with how strong the
evidence is. This page is the register. A target, formula or claim that isn't here doesn't ship.

**Strength key:** **Strong** = several trials or a meta-analysis agree. **Moderate** = a good
trial or consistent smaller studies. **Weak** = small, short or mostly secondary sources.
**Unverified** = we believe it but haven't checked a primary source yet; must be checked
before launch.

## The core: energy balance

| Claim | Strength | What the app does with it | Source |
|-------|----------|---------------------------|--------|
| Body weight changes with the balance between energy eaten and energy expended | Strong (physiology) | It is the engine of the app | Hall & Chow, "Why is the 3500 kcal per pound weight loss rule wrong?" |
| The "3,500 kcal per pound" rule overestimates *future* weight loss because the body adapts over time | Strong | We never predict "you'll lose X kg by date Y" from a static rule. We *measure* expenditure from what actually happened, so adaptation is already inside the estimate | Hall & Chow 2013; Thomas et al. validation against seven confined experiments |
| A pound of adipose tissue stores roughly 3,500 kcal (about 7,700 kcal/kg, our arithmetic) | Moderate (only roughly right; early loss includes water and lean tissue) | Used as the default energy density, with a range shown on every estimate | Hall & Chow 2013 |
| Wrist wearables estimate calories burned poorly: no device under 20% error (Stanford, 8 devices); mean absolute error over 30% for every brand (2022 systematic review); 13–30% variation against a metabolic cart (2023) | Strong | We **don't** use the watch's "active calories" as calories out. Expenditure comes from intake and the weight trend | Shcherbina et al. 2017; Germini et al. 2022 (JMIR); Eur J Sport Sci 2023 |
| Expenditure can be estimated by comparing logged intake with the smoothed weight trend, updated weekly | Moderate (the method is sound physics; MacroFactor's accuracy claims are its own, with no independent validation found) | The expenditure estimate, shown with a range | MacroFactor algorithm page |
| Consistent under-logging is cancelled out: the estimate and the target are on the same "logged" scale | Unverified (our reasoning) | Advice works for consistent loggers; partial days are detected (energy spec §4) | Our reasoning; to be written up with an example |

## Levers: what decides whether a deficit works

| Lever | Claim | Strength | What the app does | Source |
|-------|-------|----------|-------------------|--------|
| **Sleep** | One week of short sleep in healthy young men: leptin −18%, ghrelin +28%, hunger +24% | Moderate (small crossover, young men) | Sleep shown as a lever on hunger | Spiegel et al. 2004 (Ann Intern Med) |
| **Sleep** | In a 14-day calorie deficit, 5.5 h vs 8.5 h sleep opportunity: similar weight loss, but the fat share of the loss fell by 55% (1.4 vs 0.6 kg fat) and fat-free mass loss rose 60% | Moderate (n=10, crossover) | Sleep shown as a lever on *what* you lose | Nedeltcheva et al. 2010 (Ann Intern Med) |
| **Sleep** | Ghrelin rose after sleep restriction and extra intake came mostly from snacks; a 2023 one-night study found mixed results by sex and weight | Weak to moderate | Supports the hunger link; no stronger claim | 2016 study in lean men (Obesity); 2023 single-night study (secondary) |
| **Muscle** | Exercise combined with caloric restriction preserves lean mass while losing fat (network meta-analysis, 62 RCTs, 4,429 people) | Strong | Strength sessions per week as a lever | Frontiers in Nutrition 2025 |
| **Muscle** | A deficit lowers lean mass but not strength; the "≤500 kcal deficit spares lean mass" threshold is disputed | Weak (threshold) | We don't promise a "safe deficit size" for muscle | Murphy & Koehler 2021 + reanalysis (secondary) |
| **Protein** | With resistance training, gains in fat-free mass plateau around 1.6 g/kg/day total protein (49 studies, 1,863 people). Not studied specifically in a deficit | Strong (for training), Unverified (for a deficit) | Default protein target 1.6 g/kg; for higher body weights a reference weight (see energy spec §6) | Morton et al. 2018 (BJSM 52:376) |
| **Activity** | Step counts are among the more accurate wearable measures | Moderate | Steps compared with *your* normal | Germini et al. 2022 |
| **Activity** | "10,000 steps" as a universal target | Unverified / likely marketing | No universal step target | To check: step-count and mortality meta-analyses |
| **Strength frequency** | Adults should do muscle-strengthening activity on 2+ days a week | Unverified (WHO guideline, from memory) | Default lever target: 2 sessions a week | To check: WHO physical activity guidelines 2020 |
| **Food quality** | On an ultra-processed diet, people ate about 508 kcal/day more than on an unprocessed diet matched for presented calories and macros, and gained 0.9 kg in 2 weeks (n=20, inpatient crossover) | Moderate | Can't be tracked without a food database. Explained on "why" screens only | Hall et al. 2019 (Cell Metabolism) |
| **Hunger** | A subjective hunger rating is a valid thing to ask and correlate with sleep and protein | Unverified | Optional 1–5 rating next to quick-add | To check: visual analogue scale literature |
| **Stress / recovery** | HRV and resting heart rate as recovery proxies | Moderate | v1.1 recovery pillar (recovery spec) | To cite in the recovery spec |

## Guardrails

| Guardrail | Strength | v1 rule | Source |
|-----------|----------|---------|--------|
| Safe rate of loss: about 0.25–1 kg a week (NHS, via secondary sources) | Moderate | Rate choices of 0.25%, 0.5% (default), 0.75% and 1% of body weight a week; nothing faster | NHS guidance (secondary: Bolt Pharmacy); check the NHS page directly |
| "No more than 1% of body weight a week" | Unverified attribution (AHA claimed by one source) | Used as the cap above | To check |
| A calorie floor | Moderate as context, the exact number is a convention: NHLBI's 1998 guidelines describe low-calorie diets at about 1,000–1,500 kcal/day; NICE defines very-low-calorie diets as 450–800 kcal/day, a clinical intervention. The commonly quoted women 1,000–1,200 / men 1,200–1,500 split was not confirmed | Decided (13 Nov): never target below max(estimated BMR, 1,200 kcal); a "check with a doctor" note on the fastest rate | NHLBI 1998 evidence report (archived textbook); NICE CG189 |
| No deficit for under-18s or BMI below 18.5 | Safety principle | Maintain mode only for them | To cite (BMI categories: WHO) |
| Eating-disorder risk in calorie apps | To research | No streaks, no moralising copy, hide-numbers mode, support link in Settings | To cite |

## Things we refuse to claim

- **Hormones.** No consumer device measures insulin, leptin or ghrelin. We track the behaviors
  that move them (sleep, protein, training) and say so. No "hormone balancing".
- **Metabolism boosting, fat-burning foods, detox, "starvation mode" as a reason not to eat
  less.** Not supported in the form these phrases are used.
- **Exact numbers.** Expenditure, fat loss and calories burned are estimates and are always
  shown with a range.

## Source links

- Hall & Chow, why the 3500 kcal rule is wrong: https://pmc.ncbi.nlm.nih.gov/articles/PMC3859816
- Validation of the 3500 kcal rule: https://www.nature.com/articles/ijo2013112.pdf
- Stanford wearable accuracy (Shcherbina 2017): https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5491979/
- Germini et al. 2022, JMIR: https://www.jmir.org/2022/1/e30791
- MacroFactor expenditure algorithm: https://macrofactor.com/algorithm-accuracy/
- Spiegel 2004: https://pubmed.ncbi.nlm.nih.gov/15583226/
- Nedeltcheva 2010: https://www.paulogentil.com/pdf/Insufficient%20Sleep%20Undermines%20Dietary%20Efforts%20to%20Reduce%20Adiposity.pdf
- Sleep restriction and ghrelin in lean men, 2016 (Obesity): https://zendy.io/title/10.1002/oby.21321
- Exercise + caloric restriction network meta-analysis 2025: https://www.frontiersin.org/articles/10.3389/fnut.2025.1579024/full
- Resistance training during caloric restriction 2018: https://pmc.ncbi.nlm.nih.gov/articles/PMC5946208
- Morton 2018: https://pubmed.ncbi.nlm.nih.gov/28698222/
- Hall 2019 ultra-processed food: https://www.nih.gov/news-events/news-releases/nih-study-finds-heavily-processed-foods-cause-overeating-weight-gain
- Safe weight-loss rate (secondary): https://www.boltpharmacy.co.uk/guide/how-fast-can-i-lose-weight-on-a-calorie-deficit
- NHLBI 1998 obesity guidelines (archived): https://webarchive.library.unt.edu/eot2008/20080920160643/http:/www.nhlbi.nih.gov/guidelines/obesity/e_txtbk/methtri/32212.htm
- NICE CG189 evidence (VLCD 450–800 kcal): https://nice.org.uk/guidance/cg189/evidence/appendix-g-pdf-193342435
- Harvard Health on calorie deficits: https://www.health.harvard.edu/weight-loss/calorie-deficit-explained-is-it-a-safe-sustainable-approach-to-weight-loss
