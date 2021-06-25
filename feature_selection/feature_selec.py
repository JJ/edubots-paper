'''
Performs feature selection considering output variable CoVid changes  
'''




def preprocess_datos(datos):

    '''
    tWO OUTLIERS REMOVED... (rows 203 y 230)
    AgendaBot	            : 1-> Yes 0-> No
    ClassMaterialBot        : 1-> Yes 0-> No
    Age                         :	1 -> 25-35 2-> 35-45 3->45-55 4-> >55
    Experience                  : 1-> 0-05 years   2-> 06-15 years   3-> 16-25 years   4-> >25
    FAQBot                       :	1-> Yes 0-> No
    GradesBot               	:	1-> Yes 0-> No
    Gender                  	: 1 Male   2 PNTS  3 Female
    MessagingPlatformNone		:	1-> Yes 0-> No
    MessagingPlatformOther		:	1-> Yes 0-> No
    MessagingPlatformProvided	:	1-> Yes 0-> No	
    MessagingPlatformSlack	    :	1-> Yes 0-> No	
    MessagingPlatformTelegram	:	1-> Yes 0-> No	
    MessagingPlatformWhatsApp	:	1-> Yes 0-> No	
    OtherBot	            	:	1-> Yes 0-> No
    Sector	                    :   1-> University 2 -> Vocational
    Messaging Organization->Number of approaches considered
                        	    : 0-> I'd rather leave students self-organize and not be part of the chat
                                : 1-> A chat with my students in the same course / A chat with all students and teachers in the same semester/year
                                : >1 = sum of answers (considering 1, 0 and others for example 2 for 1,0 or 3 for 1,0,1)

    Degrees -> Number of degrees involved : 	
    Discipline          : 0-> No  1-> engineering, technology 2-> Science, Biomedicine 3-> Social Science 4-> Humanities
    PostCOVID changes	        : 1 -> Yes, now they use it or use it more or in a safer/different way 0 -> No change in use -> -1 No change in not using 

'''

import numpy as np

from scipy.special import gamma,psi
from scipy import ndimage
from scipy.linalg import det
from numpy import pi

from sklearn.neighbors import NearestNeighbors

__all__=['entropy', 'mutual_information', 'entropy_gaussian', 'nearest_distances', 'gen_all_combinations']

EPS = np.finfo(float).eps


def nearest_distances(X, k=1):
    '''
    X = array(N,M)
    N = number of points
    M = number of dimensions
    returns the distance to the kth nearest neighbor for every point in X

    https://gist.github.com/GaelVaroquaux/ead9898bd3c973c40429
    '''
    knn = NearestNeighbors(n_neighbors=k + 1)
    knn.fit(X)
    d, _ = knn.kneighbors(X) # the first nearest neighbor is itself
    return d[:, -1] # returns the distance to the kth nearest neighbor


def entropy_gaussian(C):
    '''
    Entropy of a gaussian variable with covariance matrix C
    https://gist.github.com/GaelVaroquaux/ead9898bd3c973c40429
    '''
    if np.isscalar(C): # C is the variance
        return .5*(1 + np.log(2*pi)) + .5*np.log(C)
    else:
        n = C.shape[0] # dimension
        return .5*n*(1 + np.log(2*pi)) + .5*np.log(abs(det(C)))


def entropy(X, k=1):
    ''' Returns the entropy of the X.
    Parameters
    ===========
    X : array-like, shape (n_samples, n_features)
        The data the entropy of which is computed
    k : int, optional
        number of nearest neighbors for density estimation
    Notes
    ======
    Kozachenko, L. F. & Leonenko, N. N. 1987 Sample estimate of entropy
    of a random vector. Probl. Inf. Transm. 23, 95-101.
    See also: Evans, D. 2008 A computationally efficient estimator for
    mutual information, Proc. R. Soc. A 464 (2093), 1203-1215.
    and:
    Kraskov A, Stogbauer H, Grassberger P. (2004). Estimating mutual
    information. Phys Rev E 69(6 Pt 2):066138.

    https://gist.github.com/GaelVaroquaux/ead9898bd3c973c40429
    '''

    # Distance to kth nearest neighbor
    r = nearest_distances(X, k) # squared distances
    n, d = X.shape
    volume_unit_ball = (pi**(.5*d)) / gamma(.5*d + 1)
    '''
    F. Perez-Cruz, (2008). Estimation of Information Theoretic Measures
    for Continuous Random Variables. Advances in Neural Information
    Processing Systems 21 (NIPS). Vancouver (Canada), December.
    return d*mean(log(r))+log(volume_unit_ball)+log(n-1)-log(k)
    '''
    return (d*np.mean(np.log(r + np.finfo(X.dtype).eps))
            + np.log(volume_unit_ball) + psi(n) - psi(k))

def mutual_information(variables, k=1):
    '''
    Returns the mutual information between any number of variables.
    Each variable is a matrix X = array(n_samples, n_features)
    where
      n = number of samples
      dx,dy = number of dimensions
    Optionally, the following keyword argument can be specified:
      k = number of nearest neighbors for density estimation
    Example: mutual_information((X, Y)), mutual_information((X, Y, Z), k=5)

    https://gist.github.com/GaelVaroquaux/ead9898bd3c973c40429
    '''
    if len(variables) < 2:
        raise AttributeError(
                "Mutual information must involve at least 2 variables")
    all_vars = np.hstack(variables)
    return (sum([entropy(X, k=k) for X in variables])
            - entropy(all_vars, k=k))


def gen_all_combinations(n_vars):
    allperms = []
    allperms = list(permutations(np.concatenate((np.zeros(n_vars-1), np.ones(1)))))
    #generate all permutations for a given subset of vars
    for i in range(2,n_vars):
        print("Generating permutations... %d " % i)
        perms = permutations(np.concatenate((np.zeros(n_vars-i), np.ones(i))))
        
        perms = list(perms)

        allperms = np.vstack((allperms,perms))

    #add all ones...
    allperms = np.vstack((allperms,np.ones(n_vars)))

    #remove duplicates
    allperms = np.unique(allperms, axis=0)

    return allperms

