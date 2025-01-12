data "azurerm_resource_group" "rg" {
  name     = "TF-AGENT-SCALESET"
}

data "azurerm_virtual_network" "vnet" {
name                = "vnet-tr-shared"
resource_group_name = "tr-shared-rg"
}

data "azurerm_subnet" "subnet" {
 name                 = "default-tr-shared-snet"
 resource_group_name  = "tr-shared-rg" #azurerm_resource_group.vmss.name
 virtual_network_name = data.azurerm_virtual_network.vnet.name
}



# #cloud-config
# bootcmd:
#   - mkdir -p /etc/systemd/system/walinuxagent.service.d
#   - echo "[Unit]\nAfter=cloud-final.service" > /etc/systemd/system/walinuxagent.service.d/override.conf
#   - sed "s/After=multi-user.target//g" /lib/systemd/system/cloud-final.service > /etc/systemd/system/cloud-final.service
#   - systemctl daemon-reload

# apt:
#     preserve_sources_list: true
#     sources:
#         hashicorp.list:
#             source: "deb https://apt.releases.hashicorp.com focal main"
#             key: | 
#                 -----BEGIN PGP PUBLIC KEY BLOCK-----

#                 mQINBF60TuYBEADLS1MP7XrMlRkn1Y54cb2UclUMH8HkIRfBrhk5Leo9kNZc/2QD
#                 LmdQbi3UbZkz0uVkHqbFDgV5lAnukCnxgr9BqnL0GJpO78le7gCCbM5bR4rTJ6Ar
#                 OOtIKf25smGTIpbSwNdj8BOLqiExGFj/9L5X9S5kfq3vtuYt+lmxKkIrEPjSYnFR
#                 TQ2mTL8RM932GJod/5VJ2+6YvrCjtPu5/rW02H1U2ZHiTtX6ZGnIvv/sprKyFRqT
#                 x4Ib+o9XwXof/LuxTMpVwIHSzCYanH5hPc7yRGKzIntBS+dDom+h9smx7FTgpHwt
#                 QRFGLtVoHXqON6nXTLFDkEzxr+fXq/bgB1Kc1TuzvoK601ztQGhhDaEPloKqNWM8
#                 Ho7JU1RpnoWr5jOFTYiPM9uyCtFNsJmD9mt4K8sQQN7T2inR5Us0o510FqePRFeX
#                 wOJUMi1CbeYqVHfKQ5cWYujcK8pv3l1a6dSBmFfcdxtwIoA16JzCrgsCeumTDvKu
#                 hOiTctb28srL/9WwlijUzZy6R2BGBbhP937f2NbMS/rpby7M1WizKeo2tkKVyK+w
#                 SUWSw6EtFJi7kRSkH7rvy/ysU9I2ma88TyvyOgIz1NRRXYsW7+brgwXnuJraOLaB
#                 5aiuhlngKpTPvP9CFib7AW2QOXustMZ7pOUREmxgS4kqxo74CuFws163TwARAQAB
#                 tFFIYXNoaUNvcnAgU2VjdXJpdHkgKEhhc2hpQ29ycCBQYWNrYWdlIFNpZ25pbmcp
#                 IDxzZWN1cml0eStwYWNrYWdpbmdAaGFzaGljb3JwLmNvbT6JAk4EEwEIADgWIQTo
#                 oDLglNjrTqGJ0nDaQYyIoyGfewUCXrRO5gIbAwULCQgHAgYVCgkICwIEFgIDAQIe
#                 AQIXgAAKCRDaQYyIoyGfe6/WD/9dTM/1OSgbvSPpPJOOcn5L1nOKRBJpztr4V0ky
#                 GoCDakIQ/sykbcuHXP79FGLzrM8zQOsbvVp/Z2lsWBnxkT8KWM+8LZxYToRGdZhr
#                 huFPHV9df0vAsZGisu4ejHDneHOTO3KqVotkky34jUSjBL7Q8uwXHY9r+5hb452N
#                 vafN1w0Y1QVhb6JjjwWHR8Rf9qkSIEi6m9o8a1M54yQC2y/Zrs6+4F3zZ4uYfTvz
#                 MyFfj0P5VmAoaowLSRdb2/JTObu0+zpKN+PjZA8BcnOf/pvqmEz83FIfo6zJLScx
#                 TVaAwj5Iz/jS04x7EvBuIP3vpgv1R6r+t0qU/7hpu7Oc0dsxhL+C8BpVY26/2hvX
#                 ozN5eG0ysSwexqwls+bnRgd6KdoHlWFNfbW8RCPKyb/s+tmFqGAY/QmxMkukgnXQ
#                 WvBoa0Gdv2AFVLYup9tEO1zF4zBPh5oQwAXDNudLTHJ4KmyEwWsOQJUjNB4y4a7j
#                 iGgK77T4KKXpo7pVDP8Ur+tmNH/d+/YFjxrfJvWt4ypE5dZmFO/FrUMvIGglOLDt
#                 A+SiQe73IpEebB8PiqNlqJ2NU7artuRxYQVColt+/1puIHwV+h0SnMoUEvYqAtxP
#                 J/N3JaiytWlesPPFWvhU/JGUAld5coEU2gbYtlenV/YmdjilIBu50sMSPGF5/6gv
#                 BAA/DbkCDQRetE7mARAA0OH1pn0vdEfSm1kdqIDP3BXBD0BRHNNgGpyXXRRJFaip
#                 bmpu7jSv3FsvN/NmG3BcLXXLFvwY/eIOr6fxRye+a5FSQEtvBnI1GHNmD5GAVT/H
#                 KiwrT5e3ReR/FQS7hCXWU4OA2bKmSEdkJ952NhyYeyAKbkOBgbnlEhtWOAdMI7ws
#                 peHAlHDqfGVOKXDh+FddCUQj/yZ2rblSzFdcC9gtcJSyHWgOQdVAEesEZ16hcZoj
#                 +6O+6BXOQWOo7EPD7lA9a1qesBkSRcxQn48IVVZ2Qx2P2FtCfF+SFX+HQdqJGl15
#                 qxE5CXTuJCMmCVnWhvcLW405uF/HmMFXdqGobEDiQsFFQrfpPVOi4T90VkW8P81s
#                 uPoAlWht1CppNnmhWlvPQsPK/oSMBBOvOEH1EnWJate8yIkveNbqzrE7Xt3sjF6k
#                 yqXaF+qW8OcDvSH/fgvVd21G10Cm77Z2WaKWvfi221oWj+WrgT8cCYv0AVmaLRMe
#                 dajuYlPRQ8KaZaESza2eXggOMP5LQs/mQgfHfwSRekSbKg/L6ctp+xrZ0DPj4iIl
#                 8+H4DxTILopAFWXA1a+uMVp8mV77gA9PyV3nIkrwgaZQ8MdhoKwvN/+SbvhpdzyF
#                 UekzMP/HOaC6JgAomluwnFCdMDFa3FMCF3QUcIyY556QdoFD7g6033xqV6vL+d8A
#                 EQEAAYkCNgQYAQgAIBYhBOigMuCU2OtOoYnScNpBjIijIZ97BQJetE7mAhsMAAoJ
#                 ENpBjIijIZ97lecP+wTgSqhCz3TlUshR8lVrzECueIg3jh3+lY56am9X4MoZ2DAW
#                 IXKjWKVWO55WPYD15A7+TbDyb4zh55m81LxSpV0CSRN4aPuixosWP4d0l+363D2F
#                 oudz+QyvoK5J2sKFPMfhdTgGsEYVO/Zbhus5oNi0kjUTD9U7jHWPS3ilvk/g2F+k
#                 T68lL9+oooleeT+kcBvbKt487JUOwMrkmHqNZdh8qmvMASAuqBcEcqjz96kVEMJY
#                 bhn2skexKfIncoo/btixzJUbnplpDfibFxUHhvWWdwIv4kl3YnrCKKGSDoJcG1mV
#                 sQegK4jWVGrqY8MnCI48iotP18ZxyqOycsZvs2jNmFlKwD9s1mrlr97HZ1MYbLWr
#                 Hq06owH0AzVRM7tzMK7EuHkFLcoa8qh3oijn8O0B7xNOKpTZ2DjajQ/1w8nqmMi5
#                 Z3Wie6ivKng/7p6c6HDrKjoQYc0/fuh1YnL60JG2Arn1OwdBsLDlzPL+Ro5iNwoJ
#                 hZ+stxoZT48iAIWonBsLU11Y+MSwWdN1Eh411HTTunrEs6SafMEhnPi7vvUIZhny
#                 Es0qOM/IUR1I0VtsurSn8aA6Y2Bp73+HuqFLx13/tPKBIUo6D7n/ywUlDCo7wtCw
#                 aSgXPw6uF+0CyLOQ0haf2j6w1OB8ayEGSkTPER5rImCJf3MGw8IECGrErAd+
#                 =emKC
#                 -----END PGP PUBLIC KEY BLOCK-----
#         microsoft-azurecli.list:
#             source: "deb https://packages.microsoft.com/repos/azure-cli focal main"
#             key: |
#                 -----BEGIN PGP PUBLIC KEY BLOCK-----
#                 Version: GnuPG v1.4.7 (GNU/Linux)

#                 mQENBFYxWIwBCADAKoZhZlJxGNGWzqV+1OG1xiQeoowKhssGAKvd+buXCGISZJwT
#                 LXZqIcIiLP7pqdcZWtE9bSc7yBY2MalDp9Liu0KekywQ6VVX1T72NPf5Ev6x6DLV
#                 7aVWsCzUAF+eb7DC9fPuFLEdxmOEYoPjzrQ7cCnSV4JQxAqhU4T6OjbvRazGl3ag
#                 OeizPXmRljMtUUttHQZnRhtlzkmwIrUivbfFPD+fEoHJ1+uIdfOzZX8/oKHKLe2j
#                 H632kvsNzJFlROVvGLYAk2WRcLu+RjjggixhwiB+Mu/A8Tf4V6b+YppS44q8EvVr
#                 M+QvY7LNSOffSO6Slsy9oisGTdfE39nC7pVRABEBAAG0N01pY3Jvc29mdCAoUmVs
#                 ZWFzZSBzaWduaW5nKSA8Z3Bnc2VjdXJpdHlAbWljcm9zb2Z0LmNvbT6JATUEEwEC
#                 AB8FAlYxWIwCGwMGCwkIBwMCBBUCCAMDFgIBAh4BAheAAAoJEOs+lK2+EinPGpsH
#                 /32vKy29Hg51H9dfFJMx0/a/F+5vKeCeVqimvyTM04C+XENNuSbYZ3eRPHGHFLqe
#                 MNGxsfb7C7ZxEeW7J/vSzRgHxm7ZvESisUYRFq2sgkJ+HFERNrqfci45bdhmrUsy
#                 7SWw9ybxdFOkuQoyKD3tBmiGfONQMlBaOMWdAsic965rvJsd5zYaZZFI1UwTkFXV
#                 KJt3bp3Ngn1vEYXwijGTa+FXz6GLHueJwF0I7ug34DgUkAFvAs8Hacr2DRYxL5RJ
#                 XdNgj4Jd2/g6T9InmWT0hASljur+dJnzNiNCkbn9KbX7J/qK1IbR8y560yRmFsU+
#                 NdCFTW7wY0Fb1fWJ+/KTsC4=
#                 =J6gs
#                 -----END PGP PUBLIC KEY BLOCK-----
#         microsoft-prod.list:
#             source: "deb https://packages.microsoft.com/ubuntu/20.04/prod focal main"
#             key: |
#                 -----BEGIN PGP PUBLIC KEY BLOCK-----
#                 Version: GnuPG v1.4.7 (GNU/Linux)

#                 mQENBFYxWIwBCADAKoZhZlJxGNGWzqV+1OG1xiQeoowKhssGAKvd+buXCGISZJwT
#                 LXZqIcIiLP7pqdcZWtE9bSc7yBY2MalDp9Liu0KekywQ6VVX1T72NPf5Ev6x6DLV
#                 7aVWsCzUAF+eb7DC9fPuFLEdxmOEYoPjzrQ7cCnSV4JQxAqhU4T6OjbvRazGl3ag
#                 OeizPXmRljMtUUttHQZnRhtlzkmwIrUivbfFPD+fEoHJ1+uIdfOzZX8/oKHKLe2j
#                 H632kvsNzJFlROVvGLYAk2WRcLu+RjjggixhwiB+Mu/A8Tf4V6b+YppS44q8EvVr
#                 M+QvY7LNSOffSO6Slsy9oisGTdfE39nC7pVRABEBAAG0N01pY3Jvc29mdCAoUmVs
#                 ZWFzZSBzaWduaW5nKSA8Z3Bnc2VjdXJpdHlAbWljcm9zb2Z0LmNvbT6JATUEEwEC
#                 AB8FAlYxWIwCGwMGCwkIBwMCBBUCCAMDFgIBAh4BAheAAAoJEOs+lK2+EinPGpsH
#                 /32vKy29Hg51H9dfFJMx0/a/F+5vKeCeVqimvyTM04C+XENNuSbYZ3eRPHGHFLqe
#                 MNGxsfb7C7ZxEeW7J/vSzRgHxm7ZvESisUYRFq2sgkJ+HFERNrqfci45bdhmrUsy
#                 7SWw9ybxdFOkuQoyKD3tBmiGfONQMlBaOMWdAsic965rvJsd5zYaZZFI1UwTkFXV
#                 KJt3bp3Ngn1vEYXwijGTa+FXz6GLHueJwF0I7ug34DgUkAFvAs8Hacr2DRYxL5RJ
#                 XdNgj4Jd2/g6T9InmWT0hASljur+dJnzNiNCkbn9KbX7J/qK1IbR8y560yRmFsU+
#                 NdCFTW7wY0Fb1fWJ+/KTsC4=
#                 =J6gs
#                 -----END PGP PUBLIC KEY BLOCK-----


# packages:
#     - curl
    # - unzip
    # - git
    # - npm
    # - curl
    # - git-core
    # - nginx
    # - apt-transport-https
    # - azure-cli
    # - terraform
    # - build-essential

# runcmd:
#     - npm init
#     - npm i
#     - npm install chromedriver
#     - curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
#     - sudo apt-get install -y nodejs
#     -rm -rf node_modules package-lock.json && npm install npm cache clear --force && npm update -g && ​npm install --no-shrinkwrap --update-binary

