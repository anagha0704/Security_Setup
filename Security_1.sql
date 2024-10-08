-- Create the PaymentEntry role
CREATE ROLE PaymentEntry;

-- Grant UPDATE permission for Invoices table
GRANT UPDATE ON Invoices TO PaymentEntry;

-- Grant UPDATE and INSERT permissions for InvoiceLineItems table
GRANT UPDATE, INSERT ON InvoiceLineItems TO PaymentEntry;

-- Grant SELECT permission for all user tables
GRANT SELECT ON SCHEMA::dbo TO PaymentEntry;

-- Add the PaymentEntry role to the d_datareader role
ALTER ROLE db_datareader ADD MEMBER PaymentEntry;
