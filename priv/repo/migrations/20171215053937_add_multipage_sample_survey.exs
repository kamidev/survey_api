defmodule SurveyAPI.Repo.Migrations.AddSample2 do
    use Ecto.Migration
  
    def up do
      execute """
      INSERT INTO surveys VALUES (
        2, 
        'Sample multi-page survey', 
        2,
        '{
          "locale": "sv",
          "pages": [
           {
            "name": "page1",
            "elements": [
             {
              "type": "rating",
              "name": "satisfaction",
              "title": {
               "default": "How satisfied are you with the Product?",
               "sv": "Hur ligger vi till?"
              },
              "minRateDescription": {
               "default": "Not Satisfied",
               "sv": "Botten"
              },
              "maxRateDescription": {
               "default": "Completely satisfied",
               "sv": "Toppen"
              }
             },
             {
              "type": "radiogroup",
              "name": "satisfaction_followup",
              "visible": false,
              "visibleIf": "{satisfaction} > 3",
              "title": {
               "sv": "Så vi är på rätt väg?"
              },
              "choices": [
               {
                "value": "yes",
                "text": {
                 "sv": "Jajamensan!"
                }
               },
               {
                "value": "maybe",
                "text": {
                 "sv": "Vi får väl se..."
                }
               }
              ]
             }
            ]
           },
           {
            "name": "page2",
            "elements": [
             {
              "type": "panel",
              "name": "personal",
              "elements": [
               {
                "type": "checkbox",
                "name": "visited_places",
                "title": {
                 "sv": "Reser du regelbundet till någon/några av dessa platser?"
                },
                "choices": [
                 {
                  "value": "denmark",
                  "text": {
                   "sv": "Danmark"
                  }
                 },
                 {
                  "value": "other_eu_country",
                  "text": {
                   "sv": "Något annat EU-land"
                  }
                 },
                 {
                  "value": "outside_europe",
                  "text": {
                   "sv": "Utanför Europa"
                  }
                 }
                ]
               },
               {
                "type": "text",
                "name": "favorite_color",
                "title": {
                 "sv": "Vilken är din favoritfärg?"
                },
                "inputType": "color"
               },
               {
                "type": "radiogroup",
                "name": "try_new_things",
                "title": {
                 "default": "How interested are you in trying new things?",
                 "sv": "Hur intresserad är du av att pröva nya saker?"
                },
                "choices": [
                 "Vill helst ha det som vanligt",
                 "Beror på vad det är",
                 "Aldrig samma sak två gånger!"
                ]
               }
              ],
              "title": {
               "sv": "Lite om dig"
              }
             }
            ]
           },
           {
            "name": "page3",
            "elements": [
             {
              "type": "panel",
              "name": "planning",
              "elements": [
               {
                "type": "matrix",
                "name": "prioritized_activity",
                "title": "Välj högst prioriterade aktivitet",
                "columns": [
                 {
                  "value": 1,
                  "text": "Överdrifter"
                 },
                 {
                  "value": 2,
                  "text": "Fusk"
                 },
                 {
                  "value": 3,
                  "text": "Personalfest"
                 }
                ],
                "rows": [
                 {
                  "value": "funding",
                  "text": "Vad är viktigast under finansiseringsfasen?"
                 },
                 {
                  "value": "study",
                  "text": "Vad är viktigast för en förstudie?"
                 },
                 {
                  "value": "prototyp",
                  "text": "Vad är viktigast vid prototyputveckling?"
                 }
                ]
               }
              ],
              "title": {
               "sv": "Planering"
              }
             }
            ]
           },
           {
            "name": "page4",
            "elements": [
             {
              "type": "panel",
              "name": "exit",
              "elements": [
               {
                "type": "comment",
                "name": "comments",
                "title": {
                 "sv": "Finns det något du skulle vilja tillägga?"
                }
               },
               {
                "type": "radiogroup",
                "name": "want_followup",
                "title": {
                 "sv": "Hur vill du skicka in dina svar?"
                },
                "isRequired": true,
                "choices": [
                 {
                  "value": true,
                  "text": {
                   "sv": "ange din unika pseudonym"
                  }
                 },
                 {
                  "value": false,
                  "text": {
                   "sv": "anonymt"
                  }
                 }
                ]
               },
               {
                "type": "text",
                "name": "pseudonym",
                "visible": false,
                "visibleIf": "{want_followup} = true",
                "startWithNewLine": false,
                "title": {
                 "sv": "Ange din pseudonym"
                },
                "defaultValue": "anonymous",
                "isRequired": true,
                "placeHolder": {
                 "sv": "Ange din pseudonym"
                }
               }
              ],
              "title": {
               "sv": "Uppföljning"
              }
             }
            ]
           }
          ],
          "showProgressBar": "top",
          "title": "Sharing Cities testenkät"
         }', 
         '2017-12-07', '2017-12-07');
        """
       end
  
  
    def down do
      execute """
      DELETE FROM surveys where id = 2;
     """
    end
  end  