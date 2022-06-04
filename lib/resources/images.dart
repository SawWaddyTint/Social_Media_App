const String NETWORK_IMAGE_POST_PLACEHOLDER =
    "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgWFhYYGBgaGhocGhgYGBoZGhoaGhoZHBoYGBgcIS4lHB4rIRocJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHhISHjQrJCs0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NP/AABEIALEBHAMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAEAAECAwUGBwj/xABAEAABAwIDBQUFBgUEAQUAAAABAAIRAyEEMUEFElFhcQaBkaHwIrHB0eEHEzJCUvEUYnKCkiMzQ7LSFVOTosL/xAAZAQADAQEBAAAAAAAAAAAAAAAAAQIDBAX/xAAlEQEBAQEAAgICAQQDAAAAAAAAARECEiExQVFhEwNScYEEIkL/2gAMAwEAAhEDEQA/AMN0j1ndW/ewIv7lQ2oIkGSNTr8FeyMwCeJzH18l59jo1M1Da8K5jp9W/dDVmXHDhGnTvV1I39aKbFRo0XiwKvcY70NSO9lHx8FbVfu2kd6kJteQReFqUrtMarFa4a3PU3WvhKvsjQZeu5EFXslX4dgDc/XBVVHNtx0hWNPs8E56pLXHLMRyCfDvzgx5qtxmY0i3VSpst8E9BnPMnh0+KsY32RbnAUgIHFNOp1QFW90ngrAM7XI/ZRjWB9VYx1+X7ogVwdT4ZeCVR8W9eKrAcZtbrrynRPbKQTFx1TCDBvXJM5co5K4UwGx9O6VFrA2bJEz6v9FOBUWgk5kcPFDPoSd42gQBwBMyUYIFr56fFVYl8cSTwGSmz8nKFDjMW5cZ7rRmpuoNgmL8fhCnTZBkm58uAVVY5Rz/AHKWfZqPvCLRYfFQqnz1T7zdQe/yQ+IqATnl18u8JgznEG3AZceaEq1fLVNXMd/rVBVWZ5DX0c+CcgEPxXO3D3eSBqvkQZ68Oc6lWP3bcslU9+YKrmBQ63L0fNDPeMuGRn3op4Enp3ICsVc9pql83k29QqXP7+amCqnQriTOI42VXimJVauQOmaJs7LTgLcFN9cCC0GJz45eCFa+9pPUwB0CmxomXGTBtEDPnmswIrYqTYzOQA95KNpYefadbzP07lThaYGfgiqY3tIAyvc+Cm1Sbn7s7ocQO5vSVdReXSSMtCSbxYJUzkNPhn4pUXfiiAJF+MKQTSScotrpPBawiLcFnUW854o+m313pfo6NpOvHv8AcimnrE5lUMzzV9MHUzwTkTpqLCSYuFMmERhgItdU4hsH480eODSZUtoFMkFDyZToNYTb5qbBn3pmZJnWmPNNJgefuTEfM/BIFM7PJK1RwFU83ib8dEzgZuVW1hI0j1mkFlGoHRB3hx0PTinqvA6T6soB4bnIQ1Z5mBlr4pUYuqCQY9dUO6S0+Sdj78Bxjh8E1WpzU57Nn13GDBvmJ9WQz37xkTbl3GfWitrEjx43nvVb6tjBy093uTMLWtbx4+rqgnly8FKrmbm1vr5eaHq1CMvrbkqwE9w77eKre7T9+9VOfJnmOvDvzUXvJ658uqchaZ7xfroh3Dop1NcvXJDVH29e9XIVD4hwBj4IZz7q6s+TePXBCFpPJaSJqTnwq9/1CYhNCrCdDTIGqIoPm8k6DgPJBMaOaIY5ZWGPo3OfJG0RyWYx3r6LQw9a4UUDNz2Z04SmazdbpJz78lIO01Omiv3QABkZF/kkoVgKe9ccBPX4IuphriOPoofA1d0wZh3Pw7kY4mTfuy7lXrEpsj32PxVTK4NpiY8OPSyqqv3fa66xc2ueCqAynllmI9d6QbzT7Pd46SqS6ZB81FlSWC2nVQZUE96dERPsqxr5y+Sk9wgeCqY2EgIao1jkO9W0vLXog31QTNvJO/BxIv1SL7e5UPdczkoF/NSa5zw6NNevr4Jg/hFuPjMIdr5y+nJM98a5+OiVB69cg6bsXcTrOXmkTGaqqM3rH3C3ThxurGCBxMXPGEsCuscs7nTv1QuJtMExplKvqv8ARnwQj7gX7wY00SVAz8iL8M4vzQrXWkRMX4nxV9UC7RYXzug6jgJAOngqkCFYmwmDAN/dz1UGU7ZZDPrKjUfM2uJjLLSVa1wIEGxHyz8UyDmne5sfP1dU4hoAsc09YxMxy7skFWrcREe5VIWmrnWY6hDVOE/FJ9YcZGUZe9UvM/RaSJVveM571W53D3p6qpe5XIVO53r4KCiHpk8JutNoVrGkZKpgMIljVlVCsMMuua0mN4W9cEDh2+CO3tJ6qL8gc2A20XUmzn4deqDoXubfTlwR9MRHj06eSlSTGQM8r3OS1adUFoOpsTGoWeQCMh3xkpYWtctOo0zkaAIlAmvU45aycvJQeRExMnK/GZsiaWza7/w0nRo4w0Rz3oPgFdT7MV/zvY0Xtd3PQBXOer9J2I06kMtORCjhnRJPcjcJ2f3SQa8zoGWyi0nor3bDYAG77vAdU/DoeUZT6otn0nRX0X8ZPeiDsWcnmOG6PgVfT2I+RD2nk4Eed0ePX4HlFGLeG0+b7Dpmfh/ksf7056clq7Z2bXlsM3mtb+UzckzaxNo8FivDm+y5sG9nAiynqX7hxeKnMn4Ji7jMefVCvqkZD3Ceii2oTb8PHM9wUmJDoN+6M1BjwT4/25d3iosYBeZjX6DJPvjhc5njGUoAlrh3jVRe/wCKpbAgqqpUAMqTWPqCLgX8vBZz62Y8I9ZJV66FdU5634owGxNaLRJORniNOBQVV0yIHP5SFe+pvZjy96Fqu4T8FUCVV9sxPKdMggzWc2dev1Ui/wDfu1QtU8BlwJvnOauQl78Y0iDnygQgX1QdM8gq6hGfxQrqhlXzzE2p1H8lQ+oRz4JnvJVbnK5CtJ7yeKhKYuTOKpJOOajulIEqW+Uw22PR1FmRJKAa0ko1j7XWFWOo1Pp+yJpvFhH7oCm/krqcpUNQW69fXiim1xbpyysgDl81qbCw4fiGNMRc94j91Oafw1tk7BfV9p5LWHTInrwXWYDZlOmRuMAPHU9Tmj2Uw0QLAIV+LaHZrok54m1nbel9QoGs8obH7fpMJBcJGcGeHzC5XanbRjQd0id48btyyHP3LLr/AJHG5z7/AML5/pdX3jpvvCHBEPqgkOmxJHuXnWE7Y773ughrGFx1EyA0EcSSfBLC9q4pPJJgPtY6ttbq26X8vX9p/wAX7egOxjGmN5XvxjYBBXkO1O0pLg9rvZdfoRMjxQrO07y2zvA21m/gidd/Nh/xz8vYMdtAD2g7S6ysRtEPEOAcP5oK86Zt97hBcbWv5hIbYd+pPytLwx2jMKx7vYdB/QT/ANTr0KrqstEERwsZXH0dqOa7em67bFPLm0nxH3lNrznmZvbjAPep65+zAOkDiOuUKVJ97+M/NTLCNe8AZXKHqccunrNZ01739OqDrGY71F+JtBsgcQ9xtNkSBZUeB7gqKrs+aqc3U+u9VOeNYTwiqP8ABDVXeuKd79ULUqK5Aas8/JCPqevopvehqjoVyJtQqv7vXBDucpvcqHOWkiaclMVCSlKeERKSaUiUwZzoU1WWynhMm/Tcr2zonpu5C/JM8kHILBovbzRNN/NAsci2OHHuSoaAdkOWnvU8NjHUHtqtuWGYmxGonxQ1GpBVuLfLHcYNlP2Ho7O0dPE0BVoOmPxs/Mw/zjQc8lwXaTtBVYWgZm8AkCJ1Igrhtm499J+8x7mOBzaSD06cl0v/AKpTrgff0hvAQH0SKbo5sgsd4Dqn/V48upafFnIHBVHVqjfvngtv7Ln/AHbJIP4iItJvdUY7CDeIa5hvkwWAHPUc7rWdsim4TSxDJ/TXY5kf3M3wfJQfsXG3LPu3z/7dWl5BzgR4InF+ml60LSw27R3GDeJO88hpMkfhHSUE0ENe0mbjpackditi7QIvQruHIF//AFlADYeNy/hsV/8ADU/8VU5qdgLEGWOYROvQjVZDqBXUM7J7Qdlhq39zd3/sQj8H2Cxjv9wU6Y4vqU7c4YSStJvMT1JXK7Oe4ndJJ18FpvJ+fT56rv8AZXYzDUW+3Xa935ixpd3NJjd8Ct7Z+xcMxwNPDh7xcPqw8g8Q38IPOJUX/t1onUkxx/ZDsbVxLg+oHU8NY77rOeP00xnf9WXCV0m16rnYhzGMMMhjGNEw1rRAich0XdYVpA3nmfgsnaG3KVJ53Gtc82c+AJIFgSBe0eSrrmYidW1zg2biSJ+7It/LPgSga+Fqgy5j7Tp8ltv7WvP5GjqPkVXhtrvrvLC1rbSC2bjv6rK88/VVt+3LVnjkfWSEcSMr/uicRhtwuYcwYueBQz3BRig9Wr6hB1SVfiIz8ELUfx8lcgVgwqXuzTvKoqvtb9k5EouKGe3VTFXmovctIFJVD0TuKD2JypDykArS0KO6VWkYtUYTpOcgkQEpTEppTDoWVolKpiBr9FifxKl9+s/BWtplYQr6eI5rCZWOQ8OJ4BdrsHsdUeA+uTSZmGf8hHObM75PIJXk9A0askAAkmwAEk9At/Adn8RVH4dwHV5j/wCok+5b2Go4fDiGNaOJzcerjcq8beAs0QFOT7P28dfRh7gRBDiCOBBII8Udh6C2Nt4UPrPe0AFzt4jjN5HNV4ahyT0IUWFFMaeCMoYcIynhgkGczfGRI6Eolj6v63/5FaLMMEXSwoRg1mU6bzm53iUbRwBOZK06OFCMp0E8LQ+BwAC6LCUYCFw1NadJsBXzEWh9q1d2i4jPLvJgeZXE7X7PYkHeYGvbGQd7XEyHWN+B4LucewPaGH9TT/id74KNQlHXOiXHlVSuWHdcCx2oI3TwyOiL2fif9Rr2ZgtnoTEeErsdtUqJZ/rBpGkiST/IBeei5DD4DcL3U2PIEuDD7T4As3qfjqs7zjSXQvafFN/iH31//LQsV+JBGfOSsLF7Tc573OkOLjvA5zNwQcr6Kh2PPFPwo8m4+v09BC1HTxWUcaoOxqc4peQ6o+FA1Oaz3YnmmGJAVeBeQwkJ2m10A/EqP8Qn4UvKNI1IVW+ECa6i6qnOR5C3uVZqIf7xMXqpynV5cmcVRvpt5PBq6Ut5Vb6W+jBqyLqxjT3nTj05pwF1P2fbOFbFtLhLaTS+P5gQG+ZnuUWrx1PZXs0zDMFaq0OrkSAbinOg/n4nTIcz9o7UibrR2iM1xu1STKxtVFOJ2sSc0BU2m/QoV9lS4JyBoYbFlzhvFdDhQDmJXHtdC3dh7Va47jjB0PH6osDpaeFGivbQIV2EYCtOnhZQGaxnJFU2HgVoMwatZhU8Toegw8EUxh4K9lAohlI8FUhaWGo8UWCB0CrdIF+4KipQe+28Gi06k/yhV8Ey9qVK7qrTReGhoM7zd4OnTu5KDqGIcParu6MYxg8YnzU8Z2gweGeab6vttIDgGOdulwkA7oIFiPFGYfGU6zN+k9r28WnI8CMweRU/7PL+GazYRneJuc3El7z/AHFGMwYYIaIHmeZK0sO6QpvppyQteZ9vexwrMdiKLYrNEvaB/uNHL9YGR1y4R4+4r6ldQXz/APaDsoYfHVmNENcQ9o4B43iOXtb3dCrkVzBKjKsLVEtVlYhKUp4ShMjSlKUJwEA0pSnhNCASUpQkgiSlJJAKUpSSQGgF2X2V4trcY5jj/uUy0dWkGPCfBcU4qWExTqb21GGHMcHNPAhZY119C4/B52XI7V2YRcBdX2P7SUsfRBBAqNAD2ag8RxC0sVsmZhR1xvwJ08Xx+FMyEBC9T2p2bDgfZg8QuI2tsF9MyWmP1DLv4FR8K1zeJyQdDeBzI71r1cOTohThiNFUobmyO1TqJa2oC5h/OMx1Xouy9rU6gBa8FeT06IIgiUfg8G5l6byzkbhLRj2ei8HVGMheW4PaWKZ+h39xHvC2MNtzEmwpg/3hVOkXl6A0BKriWMaXOcABmSuSoV8a/SmzmSXHwA+K0KPZp1S+IqPeP0N9hnfFz4q5bfiFjC2t2vqVnvZhGOLGWfVg3P6WfErT7MbWD2bjnbrxo765rqsPsymxoYxjWtFgGgADuC5jtxs57MO5+HYS/Ilg9po1Ii/gleep7Esvp5h2srVqeNqGoGF7iN7cLXAgANBc2fZMAZwuk+z3Z1QOfiSNym5ha0A2eZuc8gQe8rG7PdnsRUJ3cMQ4ky+oxzWNnX2rOPiV6lsrs+WU2Ui47jZni8klzjykkrOS9dbjbrrOc0Xspm8C6baFcD237U124p2GpVPuWNLAXtgOdvMDi4vOTRO7Aj8Jk6D1P+Fbubg9lsRa0LkqX2Z4IVDUca1QkzDqhDeN90AnxWvXNsyMueuZdsCdg21XVH/69SvRayC+pvEGpIIDC7O29MWuF5v9rWJa/aVQN/IxjCf5g3ePhvR1BXrna/tJR2bhwym1v3paRRojIfzOAyYPM2XzxiHOc9z3uLnucXOcc3OcSXE8yZKJPGZbtO3yvlgXdUCxFGmouZE9yNGBixLdRW5670wp2T8h4hixMGZop1NM1lyjyLxDhqjuoiMlU5qcpWKi1NCtdpzUE9LEYTQpOKUJgwCUKSZAEuVbhaFcoOYolVYlszaVXD1BUpPLHDUa8iNQvZeyP2o0aobTxMU35b/5Hd+i8ReNVWrzU/D64pPY9ocxwcDkQZVVXBNdYgEcxK+ZtjdpsVhTNGq5o/STLf8AEr0PY32xOENxFGf52Hz3Sps/QdptLsRQqSWTTdyu3/E/CFz2J7CV2/hDHji0we8H6ro9l/aBgK8RWDCfyvG6fNdJh8ZTeJY9jhycCo8JT8rHlLuyNUG7COtkTh+y1VeqgpiwcB4I/j/Y8nB4Psy4fiW/gtiNbot3dHBSCc4hXqqsPhWt0RQaq5SlXCWSn3lVvDigcdtrDURNWvTYP5ntHvKNDRI43UguE2p9quz6Uhr31nDSm0x/k6G+BXFbY+2bEPluGospD9bz946OIbZoPWUw9qxeJZSYX1Htpsbcue4NaOpNl5n2q+1mmwFmCG+cjXe0hg/oYbuPMwOq8px20sTi3B2IrPqHQOPsj+lo9lvcAiaeDYRBEgg+WqjrvF886f8AjRiHmpWrzUddz6jjMyBlGXADIDgmrUKf5Hh8HNodERnLgNeuqqGzKUxBB/qPci8NhA1u80EDe3Yz9rmfWSxtm+rW8nWe5AjqUAHwGeZtdRfh7GeV+6VpupDwMCeUrNdtVrKmW80EEgcRFp7s0Tb8JuT5VOo+63r1mmLDFhp9IW/U2tTrN3W0zMfid+X+hosMszJOed0A+jEC+jbeZju80p1fuKvOM00s/eo0mfi0z8fUrQfSAIH7c5KIwOynvDnBs2JsDAtn7/JO9ST2mc2/DEa3LW3zUH0zHeY7gStD7qCQQd4RcCbwPmq3ssDGZHuA8/iqnSbyzXU8+Vx0UHssid3LnA9eA8VQOHArSVNikiEmjVPUKkRZWlBPZJwun3UBc0qcqhrk+8ow9ScxUOpq/eUyUS2CzQKSKcwFVuo8Fc6ibzVKJoY2oz8D3N/pcR7iqTSKjBR6pe43cN2wxzPw4mp3un3rUo/aXtFv/MD/AFMaVxqSMg2u7b9qu0B+emf7PqnP2r7Q/VT/AMPquDSRkGu4qfaltE/8jB0pj4oGv9oO0X54l45NaxvubK5cNKW4UZB7aOK7QYqp+PE1ncjUfHhMLOLiTJueamKBVrKIRsh+NocNJReGwpJVlIC1hzRDKuaz66v0vnmCmUw2J/bgrTUMGDBiPEoIVb8QmbWsZ5LPF6oqfesdvAkxF8xysVpYLFOIl7tSQ2bAnMxxMIR1Xz9fNVsq35XsqvufAlz7bD64kGeBPL8RKFrUKbnFxAJlvLQaBCfe2118EnVveVMlnwLZWkwNa126ALZC14z6q5rhY2tF9eY96yBXzvGXuKupYiAT4+UKbKcqe0N5zWtaQLNJ8BN+qt2LtHFU2ubTI3XC4cZBjWON0L/EG03y7rJqOKIaWg6Hzv8AAqv/ADmDfe6KdXJkudcwSQAOsAc/chqxsQD+UEd0+F0Nvjjp8AomrcRqIPXNOc4V6RrP4cyPI3VFR150I80zj7vcmHArSRnaZ5kqdQqAZBSc5MibmnB5JgfcnQEU4SSQCCmUkkGTVJJJIEk5JJAVFJJJURBOkkgJtSakkkZ2/NOMkkkgm3RTanSUrhvkoPy8PcUkkQEcj3e9Vn14pJJxNX01D5lJJIyGZ7vcrqWR6fJJJFOIu+XuUWfi70kkBB/xKY6d/wAEkk4Sg596Q06JJKkJlVlJJEMhkUinSQT/2Q==";