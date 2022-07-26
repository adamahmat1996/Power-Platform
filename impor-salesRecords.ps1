# location of csv file that contains source and destination sites
Gr$data = Import-csv ".\Sales-Data.csv"
# connect to tenant/site
Connect-PnPOnline -Url https://koulallc.sharepoint.com/sites/BISD/ -Interactive
# for each row in the csv file, do the following
foreach ($row in $data)
{
Add-PnPListItem -List "Sales Records" -Values @{"OrderDate" = $($Row.OrderDate);
"Region"=$($Row.Region);
"Representative" = $($Row.Rep);
"Item" = $($Row.Item);
"Units"=$($Row.Units);
"UnitCost" = $($Row.'Unit Cost');
};
}