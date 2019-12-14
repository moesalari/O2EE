#Part 1: Data Capture
#----------------------------------------------------------------#

#importing requarments
import feedparser as fp
import pandas as pd


def dataChapture (url,N):
    #connect and parsing the rss
    articles = fp.parse(url)
    
    try:
        #check enteries
        testLen = len(articles.entries[N])

        try:#
            data = pd.DataFrame([]) 

            for i in range(0, N):
                entry = articles.entries[i]

            #data cleaning        
                #removing <p> and </p> from begining and end of string
                if entry.summary[0:3] == '<p>':
                    entry.summary = entry.summary[3:]
                if entry.summary[-4:] == '</p>':
                    entry.summary = entry.summary[:-4]

                #cleaning if title has '(arXiv:' 
                arXiv_Find = entry.title.find('(arXiv:')
                if arXiv_Find != -1:
                    entry.title = entry.title[:arXiv_Find]

            #populate dataframe       
                data = data.append(pd.DataFrame({'Title': entry.title, 'Link': entry.link, 'Description':entry.summary}, index=[i]))

            #Save data    
            data.to_csv(r'Top_N_Papers.csv',index=False)
            print('File Top_N_Papers.csv is saved')

        except Exception as ex:
            print(ex)

    except:
        print ('Could not pars url')


# normal scenario
N = 100 
url = "http://export.arxiv.org/rss/cs"
dataChapture (url,N)

# test scenarios

# wrong url
#N = 100 
#url = "moe"
#dataChapture (url,N)

# out of index
#N = 1000 
#url = "http://export.arxiv.org/rss/cs"
#dataChapture (url,N)



