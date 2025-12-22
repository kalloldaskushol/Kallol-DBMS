```mermaid
erDiagram
    CATEGORIES ||--o{ MENU_ITEMS : "has"
    CUSTOMERS  ||--o{ ORDERS     : "places"
    ORDERS     ||--o{ ORDER_ITEMS: "contains"
    MENU_ITEMS ||--o{ ORDER_ITEMS: "included in"
    ORDERS     ||--o{ PAYMENTS   : "paid by"

    CATEGORIES {
        int category_id PK
        varchar category_name "UNIQUE, NOT NULL"
    }

    CUSTOMERS {
        int customer_id PK
        varchar customer_name "NOT NULL"
        varchar phone_number
        varchar email
        varchar address
    }

    MENU_ITEMS {
        int item_id PK
        varchar item_name "NOT NULL"
        decimal price "NOT NULL"
        int category_id FK
    }

    ORDERS {
        int order_id PK
        int customer_id FK
        datetime order_date "DEFAULT NOW()"
        varchar order_status "DEFAULT 'PENDING'"
        decimal total_amount
    }

    ORDER_ITEMS {
        int order_item_id PK
        int order_id FK
        int item_id FK
        int quantity "NOT NULL"
        decimal subtotal
    }

    PAYMENTS {
        int payment_id PK
        int order_id FK
        datetime payment_date "DEFAULT NOW()"
        decimal amount_paid
        varchar payment_method
    }
