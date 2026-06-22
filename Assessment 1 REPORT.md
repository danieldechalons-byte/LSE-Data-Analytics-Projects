### Assignment Report

2Market is an international supermarket chain, with both physical and online stores. 2Market are
wanting to find out which advertising channels are most eﬀective, which products sell best and
how those factors tie into their customer demographics.<br><br>
Their business problem:

> ***2Market are looking for a deeper understanding of their customer base and
eﬀectiveness of current advertising channels in order to better direct resources and
increase revenue intake and profitability.***

To solve this I could ask what is the ultimate goal for 2Market? Would they eventually want to
diversify their product portfolio, would they be open to my making of suggestions, derived from
the analysis that I undertook on their data? Perhaps if those customers with children are more
likely to enter their physical stores, it might be sensible to suggest impulse purchases be targeted
at this audience, how would they like me to approach this data set?

To clean and analyse the data I first worked to make things clearer for myself to understand the
dataset, and to make sure there were no hidden errors or anomalies within the dataset to enable
as seamless analysis as I am able. I conducted a spell-check across the table, used TRIM on all
text columns to make sure there were no hidden spaces; for the same columns I used PROPER to
bring them all to the correct case. I used ctrl+a then ctrl+g to find and replace all blanks with #N/A
for Excel and Tableau analysis (for pgAdmin, to blank). Then I worked to change the header
names to make them more consistent (my general rule of thumb with naming: will I still be able to
understand this if it is put down and I come back to it after 6 months?). So, and to avoid
ambiguity, I changed generally as: ‘Kidhome’ to ‘customer_younger_children’, ‘AmtLiq’ to
‘spent_alcohol’, and so on. All headings were kept lower case for SQL analysis.

When customer age I ran a find and replace (replace to #N/A and as above blank for SQL) for all
ages >110. 110 because above this is more likely a mistake of entry at the source, rather than
there really being a customer of that age; I didn’t want analysis to be skewed. Then, for the
education and marital status columns, I ran UNIQUE (as I know there will be limited results, unlike
the YoB column) to see what was returned. I changed anomalous results ‘Alone’ and ‘Yolo’ to
‘Single’ because they can be understood as synonymous. ‘Absurd’ changed to ‘Unknown’, as
which category this would fall into cannot sensibly be inferred. ‘Together’ to ‘Civil Partnership’ as I
wanted to classify all the relationship status’ with their closest legal-terms counterpart. Text to
column was used to sort the dates so that they were properly interpreted by Excel, where my
system is set to UK format dates.

The first thing I wanted to show was the total spend per country. Initially, I wanted to show this via
the world map visual, but found with the limited number of countries that are in 2markets base it
would be better to show this in a bubble diagram (too few countries to sensibly split by region, or
hemisphere). This way it is immediately obvious which country spends the most with the
business, and which the least. In this case it also allows the eye to immediately group certain
countries; i.e., Spain stands out by itself with the highest count of customers (visual to be
described later) and highest total spend across all products. South Africa and Canada look
around the same size (granularity does not matter so much to this target audience) and so do the
US, Australia, India and Germany, Montenegro is an outlier. To confirm this/to see detail, I
included this visual as an interactive element that filters the other tables included on the
dashboard, so that the viewer can see how the demographics are broken down.
First, with the key insights at the top in a ‘KPI’ style I included top purchase method (in store or
online), the average age and the total spend. This way one can see what each of these are overall,
and per country when filtering.

I also wanted to breakdown how much was spent on each of the products, and so included a
table for quick reference in the top right of the dashboard. Number of customers sits below this,
and below that is the amount of customers per ‘influencing’ category. How many customers
belong to each category of education, marital status, which income bracket they sit in and their
child status. All of this is filtered by the same bubble diagram, and for a deeper look across
categories, these tables can also be used to filter the other visuals (perhaps to see how much
those people who are married and with children spend, vs those without children).
I included a second dashboard so as to not make the initial one too busy. In this I cover
advertising metrics. It is a simple count of conversions to each demographic category, or
‘influence’ factor. Each category is a horizontal bar chart covering each of the ad types, and to
keep it less ‘busy’ and not to overwhelm the eye, I have made each colour belong to a single
category.

In terms of spend per head, Montenegro has the highest at around $1040, and the lowest comes
to India at $529. So, the Montenegro market may be worth developing, to test wether this average
per head spend is due to the small sample size, or if people really are spending more here.
Otherwise, treating Montenegro as an outlier, the range of spend per head sits at $102, India is as
stated and first is Germany at $631.<br>
Alcohol and meat by far are the biggest revenue generators across all categories, making up the
majority of total spend, and so might be worth tying up impulse purchases from across diﬀerent
categories into those respective aisles.<br>
The biggest group in terms of purchase influencers are those with the first level of higher
education achievement, with a bachelors or equivalent; directing resource for marketing might
well go to strengthening this segment, or perhaps to entice people from other categories so as to
broaden the demographics.<br>
The main recommendation I can make in terms of data from 2Market, would be to increase the
granularity. For instance, the customer has children, but do they live with their children currently?
What time are purchases made? And so on, in the same vein. This would allow for deeper insight
into customers’ behaviour, and so greater insight into purchasing behaviour, which could then
drive sales.
