## Priors
bayes.data1 <- data.frame(
  theta <- t,
  prior <- dbeta(t, shape1 = alpha1, shape2 = beta1), 
  likelihood <- dbinom(8, 170, t),
  posterior <- dbeta(t, shape = x + alpha1, shape2 = n - x + beta1) )

ggplot(data = bayes.data1, mapping = aes(x = theta, y = prior, color = "prior")) +
  geom_line() + ylab('density') +
  geom_line(mapping = aes(x = theta, y = 30 * likelihood, color = "likelihood")) +
  geom_line(mapping = aes(x = theta, y = posterior, color = "posterior")) +
  scale_color_discrete(name = "Distribution") + 
  labs(title = 'Posterior, likelihood, and prior of the vaccine study, own belief')


## Posteriors
posteriors <- data.frame(
  theta <- t,
  post_1 <- dbeta(t, shape = x + alpha1, shape2 = n - x + beta1), 
  post_2 <- dbeta(t, shape = x + alpha2, shape2 = n - x + beta2),
  post_3 <- dbeta(t, shape = x + alpha3, shape2 = n - x + beta3),
  post_4 <- dbeta(t, shape = x + a1, shape2 = n - x + b1),
  post_5 <- dbeta(t, shape = x + a2, shape2 = n - x + b2),
  likelihood <- dbinom(8, 170, t)
)

ggplot(data = priors, mapping = aes(x = theta, y = post_1, color = "own belief")) +
  geom_line() + 
  geom_line(mapping = aes(x = theta, y = post_2, color = "P&B's parameters")) +
  geom_line(mapping = aes(x = theta, y = post_3, color = "alternative parameters")) +
  geom_line(mapping = aes(x = theta, y = post_4, color = "flat prior")) +
  geom_line(mapping = aes(x = theta, y = post_5, color = "Jeffery prior")) +
  geom_line(mapping = aes(x = theta, y = 30 * likelihood, color = "Likelihood")) +
  scale_color_discrete(name = "Distributions") + 
  labs(title = 'Posterior Distributions and Likelihood of the P&B Vaccine Study')