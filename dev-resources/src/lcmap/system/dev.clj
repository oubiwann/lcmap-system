(ns lcmap.system.dev
 "For use with a REPL."
  (:require [clojure.tools.logging :as log]
            [clojure.tools.namespace.repl :as repl]
            [clojure.walk :refer [macroexpand-all]]
            [clojusc.twig :as logger]
            [lcmap.system.core :as lcmap-system]))

(logger/set-level! ['lcmap] :info)

;;; Aliases

(def reset #'repl/refresh)
(def reload #'repl/refresh)
