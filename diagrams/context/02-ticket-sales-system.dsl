workspace "ticket-sales-system" {
    
    model {
        user = person "User" {
            tags "person"
            description "The user purchases tickets for events."
        }
        
        ticket_sales = softwareSystem "Ticket Sales System" {
            tags "ticket-sales"
            description "System to buy tickets for events."
        }
        
        payments = softwareSystem "External Payment System" {
            description "External system to make payments."
        }
        
        user -> ticket_sales "Uses"
        ticket_sales -> payments "Receive payments"
    }
    
    views {
        styles {
            element "person" {
                shape person
                background #cf4444
                color #000000
            }
        
            element "ticket-sales" {
                shape roundedbox
                background #bf7343
                color #000000
                
            }
        }
        
    }
    
}