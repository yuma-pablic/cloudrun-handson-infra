resource "google_compute_security_policy" "waf_policy" {
  name    = "cnsrun-waf-policy"
  project = var.project_id

  rule {
    action      = "deny(403)"
    priority    = "1001"
    description = "SQL injection"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('sqli-v33-stable')"
      }
    }
  }

  rule {
    action      = "deny(403)"
    priority    = "1002"
    description = "Cross-site scripting"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('xss-v33-stable')"
      }
    }
  }

  rule {
    action      = "deny(403)"
    priority    = "1003"
    description = "Local file inclusion"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('lfi-v33-stable')"
      }
    }
  }

  rule {
    action      = "deny(403)"
    priority    = "1004"
    description = "Remote file inclusion"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('rfi-v33-stable')"
      }
    }
  }

  rule {
    action      = "deny(403)"
    priority    = "1005"
    description = "Remote code execution"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('rce-v33-stable')"
      }
    }
  }

  rule {
    action      = "deny(403)"
    priority    = "1006"
    description = "Method enforcement"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('methodenforcement-v33-stable')"
      }
    }
  }

  rule {
    action      = "deny(403)"
    priority    = "1007"
    description = "Scanner detection"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('scannerdetection-v33-stable')"
      }
    }
  }

  rule {
    action      = "deny(403)"
    priority    = "1008"
    description = "Protocol attack"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('protocolattack-v33-stable')"
      }
    }
  }

  rule {
    action      = "deny(403)"
    priority    = "1009"
    description = "Session fixation attack"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('sessionfixation-v33-stable')"
      }
    }
  }

  rule {
    action      = "deny(403)"
    priority    = "1101"
    description = "cve-canary"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('cve-canary')"
      }
    }
  }

  rule {
    action      = "deny(403)"
    priority    = "1102"
    description = "json-sqli-canary"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('json-sqli-canary')"
      }
    }
  }

  rule {
    action      = "allow"
    priority    = "2147483647"
    description = "Default rule - allow all traffic"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
  }
}
