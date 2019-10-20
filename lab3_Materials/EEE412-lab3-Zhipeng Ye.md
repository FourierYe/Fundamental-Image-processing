### Orthonormal basis



When I see this question, the first thing come to my mind is the orthogonal vectors which means two vectors are prendicular to each others. Suppose $ \vec a, \vec b$ are two orthogonal vectors , then  $\vec a* \vec b=0$. So we can use this properity to demonstrate whether it is a orthogonal matrix. Furthermore, if column vectors in a matrix are orthogonal to each others, therefore we call this matrix as a orthogonal matrix and the orthogonal matrix have a special property of $A^T A = I$. 

To normalize them to orthonormal, we should use the Schmidt orthogonalization. The principle of this progress is shown below. 

Firstly, we must understand a important concept of projection matrix. If we want to know the projection of $\vec b$ at $\vec a$. we can use projection matrix.
$$
Projection = \frac{A^T B}{A^T A}A
$$
Next, we introduce Schmidt orthogonalization formula at $R^3$ vector space.
$$
B' = B - \frac{A^TB}{A^T A}A \\
C' = C - \frac{A^T C}{A^T A}A - \frac{B^TC}{B^TB}B
$$
For $R^n$ vector space, the truth of this formula is that we reduce the weights of vector at other vectors.

Of course, it can also introduce the concept of norm which is a terminology at functional analysis. 

