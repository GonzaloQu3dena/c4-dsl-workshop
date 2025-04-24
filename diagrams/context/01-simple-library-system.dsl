workspace "simple-library-system" {
    
    model {
        user = person "User" {
            tags "person"
            description "The user consults books online"
        }
        
        digital_library = softwareSystem "Digital Library System" {
            tags "digital-library"
            description "System that contains an online book catalog."
        }
        
        ministry_of_culture = softwareSystem "External System" {
            tags "external-service"
            description "External System that provides catalog updates."
        }
        
        user -> digital_library "Uses"
        digital_library -> ministry_of_culture "Receive catalog updates"
    }
    
    views {

        styles {
            element "person" {
                shape person
                background #84C1FF
                color #000000
            }
            
            element "digital-library" {
                shape roundedbox
                background #bdd48a
                color #000000
            }
        }
    }
    
}