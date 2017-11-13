
# coding: utf-8

# In[5]:


"""epsiron Greedy"""
class EpsilonGreedy():
    def __init__(self, epsilon, counts, values):
        self.epsilon=epsilon
        self.counts=counts
        self.values=values
        return
    """初期化"""
    def init_arm(self,n_arms):
        self.counts=np.zeros(n_arms)
        self.values=np.zeros(n_arms)
        return
    """アーム選択のルール"""
    def selest_arm(self):
        if random.random() > self.epsilon:
            #ε以上なら最も期待値が高いアームを選択
            return np.argmax(self.values)
        else:
            #ε以下ならランダムに選択
            return r(0,len(self.values))
        
    """アームの期待値を更新"""
    def update(self,chosen_arm,reward):
        self.counts[chosen_arm]=self.counts[chosen_arm]+1
        n=self.counts[chosen_arm]
        
        #期待値を更新
        new_value=((n-1)/float(n))*self.values[chosen_arm]+(1/float(n))*reward
        self.values[chosen_arm]=new_value
        return
    


# In[ ]:




